import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'photo_actions.freezed.dart';
part 'photo_actions.g.dart';

@freezed
abstract class PhotoFilter with _$PhotoFilter {
  const factory PhotoFilter({String? creditorId, DateRange? range}) =
      _PhotoFilter;
}

@riverpod
class PhotoFilterController extends _$PhotoFilterController {
  @override
  PhotoFilter build() => const PhotoFilter();

  void setCreditor(String? creditorId) =>
      state = state.copyWith(creditorId: creditorId);

  void setRange(DateRange? range) => state = state.copyWith(range: range);
}

@Riverpod(keepAlive: true)
PhotoActions photoActions(Ref ref) => PhotoActions(ref);

final class PhotoActions {
  const PhotoActions(this._ref);

  static const _uuid = Uuid();

  final Ref _ref;

  Future<String?> capture() async {
    final storage = await _ref.read(photoStorageProvider.future);
    return storage.capture();
  }

  Future<void> discard(String fileName) async {
    final storage = await _ref.read(photoStorageProvider.future);
    await storage.delete(fileName);
  }

  Future<ReceiptPhoto> attach({
    required String fileName,
    String? creditorId,
    String? transactionId,
    String? paymentId,
  }) async {
    final photo = ReceiptPhoto(
      id: _uuid.v4(),
      fileName: fileName,
      creditorId: creditorId,
      transactionId: transactionId,
      paymentId: paymentId,
      takenAt: _ref.read(clockProvider)(),
    );
    await _ref.read(photoRepositoryProvider).add(photo);
    return photo;
  }

  Future<void> delete(ReceiptPhoto photo) async {
    await _ref.read(photoRepositoryProvider).delete(photo.id);
    final storage = await _ref.read(photoStorageProvider.future);
    await storage.delete(photo.fileName);
  }
}
