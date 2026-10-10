import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/app.dart';

void main() {
  testWidgets('NoodoApp affiche l\'accueil en français', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: NoodoApp()));
    await tester.pumpAndSettle();

    expect(find.text('Accueil'), findsOneWidget);
  });
}
