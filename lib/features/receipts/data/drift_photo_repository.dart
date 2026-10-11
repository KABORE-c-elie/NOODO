import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';

final class DriftPhotoRepository implements PhotoRepository {
  const DriftPhotoRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<ReceiptPhoto>> watchPhotos(PhotoQuery query) {
    final p = _db.receiptPhotos;
    final creditorId = query.creditorId;
    final range = query.range;
    final conditions = [
      if (creditorId != null) p.creditorId.equals(creditorId),
      if (range != null) ...[
        p.takenAt.isBiggerOrEqualValue(range.start),
        p.takenAt.isSmallerThanValue(range.end),
      ],
    ];
    final select = _db.select(p)
      ..orderBy([(p) => OrderingTerm.desc(p.takenAt)]);
    if (conditions.isNotEmpty) select.where((_) => Expression.and(conditions));
    return select.watch().map((rows) => rows.map(_toDomain).toList());
  }

  @override
  Future<ReceiptPhoto?> findById(String id) async {
    final row = await (_db.select(
      _db.receiptPhotos,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
    return row == null ? null : _toDomain(row);
  }

  @override
  Future<void> add(ReceiptPhoto photo) => _db
      .into(_db.receiptPhotos)
      .insert(
        ReceiptPhotosCompanion.insert(
          id: photo.id,
          fileName: photo.fileName,
          creditorId: Value(photo.creditorId),
          transactionId: Value(photo.transactionId),
          paymentId: Value(photo.paymentId),
          takenAt: photo.takenAt,
        ),
      );

  @override
  Future<void> delete(String id) =>
      (_db.delete(_db.receiptPhotos)..where((p) => p.id.equals(id))).go();

  ReceiptPhoto _toDomain(ReceiptPhotoRow row) => ReceiptPhoto(
    id: row.id,
    fileName: row.fileName,
    creditorId: row.creditorId,
    transactionId: row.transactionId,
    paymentId: row.paymentId,
    takenAt: row.takenAt,
  );
}
