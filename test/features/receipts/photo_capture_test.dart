import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/receipts/data/drift_photo_repository.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';

import '../../helpers/fake_photo_storage.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/pump_app.dart';

void main() {
  late AppDatabase db;
  late FakePhotoStorage storage;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() {
    db = createMemoryDatabase();
    storage = FakePhotoStorage()..captureQueue.add('recu.jpg');
  });

  Future<void> seedCreditor(WidgetTester tester) => tester.runAsync(
    () => DriftNodeRepository(db).addCreditor(
      const CreditorNode(
        id: 'awa',
        supplierName: 'Maman Awa',
        balanceDueFcfa: 0,
      ),
    ),
  );

  Future<List<ReceiptPhoto>?> storedPhotos(WidgetTester tester) =>
      tester.runAsync(
        () => DriftPhotoRepository(db).watchPhotos(const PhotoQuery()).first,
      );

  testWidgets(
    'photo prise, rangée chez un créancier et visible dans sa fiche',
    (tester) async {
      await seedCreditor(tester);
      await pumpNoodoApp(
        tester,
        db: db,
        now: now,
        photos: storage,
        initialLocation: AppRoutes.receipts,
      );

      await tester.tap(find.byTooltip(frenchL10n.takePhotoTooltip));
      await tester.pumpAndSettle();
      expect(find.text(frenchL10n.attachPhotoTitle), findsOneWidget);
      await tester.tap(
        find.widgetWithText(
          DropdownButtonFormField<String>,
          frenchL10n.photoCreditorLabel,
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Maman Awa').last);
      await tester.pumpAndSettle();
      await tester.tap(find.text(frenchL10n.save));
      await tester.pumpAndSettle();

      final photos = await storedPhotos(tester);
      expect(photos!.single.fileName, 'recu.jpg');
      expect(photos.single.creditorId, 'awa');
      expect(photos.single.takenAt, now);
      expect(storage.deleted, isEmpty);

      await tester.pumpWidget(const SizedBox.shrink());
      await pumpNoodoApp(
        tester,
        db: db,
        now: now,
        photos: storage,
        initialLocation: AppRoutes.creditorPath('awa'),
      );
      expect(
        find.bySemanticsLabel(
          frenchL10n.photoSemantics('Maman Awa', '14 oct. 2026'),
        ),
        findsOneWidget,
      );

      await unmountApp(tester, db);
    },
  );

  testWidgets('rangement annulé : le fichier est effacé', (tester) async {
    await seedCreditor(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      photos: storage,
      initialLocation: AppRoutes.receipts,
    );

    await tester.tap(find.byTooltip(frenchL10n.takePhotoTooltip));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(180, 60));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.attachPhotoTitle), findsNothing);
    expect(storage.deleted, ['recu.jpg']);
    expect(await storedPhotos(tester), isEmpty);

    await unmountApp(tester, db);
  });

  testWidgets('créancier obligatoire quand il en existe', (tester) async {
    await seedCreditor(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      photos: storage,
      initialLocation: AppRoutes.receipts,
    );

    await tester.tap(find.byTooltip(frenchL10n.takePhotoTooltip));
    await tester.pumpAndSettle();
    await tester.tap(find.text(frenchL10n.save));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.requiredField), findsOneWidget);
    expect(await storedPhotos(tester), isEmpty);

    await unmountApp(tester, db);
  });
}
