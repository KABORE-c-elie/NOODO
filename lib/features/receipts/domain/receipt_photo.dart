import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/date_range.dart';

part 'receipt_photo.freezed.dart';

@freezed
abstract class ReceiptPhoto with _$ReceiptPhoto {
  const factory ReceiptPhoto({
    required String id,
    required String fileName,
    String? creditorId,
    String? transactionId,
    String? paymentId,
    required DateTime takenAt,
  }) = _ReceiptPhoto;
}

@freezed
abstract class PhotoQuery with _$PhotoQuery {
  const factory PhotoQuery({String? creditorId, DateRange? range}) =
      _PhotoQuery;
}

abstract interface class PhotoRepository {
  Stream<List<ReceiptPhoto>> watchPhotos(PhotoQuery query);

  Future<ReceiptPhoto?> findById(String id);

  Future<void> add(ReceiptPhoto photo);

  Future<void> delete(String id);
}
