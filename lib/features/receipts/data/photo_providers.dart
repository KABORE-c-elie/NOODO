import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/features/receipts/data/drift_photo_repository.dart';
import 'package:noodo/features/receipts/data/photo_storage.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_providers.g.dart';

@Riverpod(keepAlive: true)
PhotoRepository photoRepository(Ref ref) =>
    DriftPhotoRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
Future<PhotoStorage> photoStorage(Ref ref) => DevicePhotoStorage.open();

@riverpod
Stream<List<ReceiptPhoto>> photos(Ref ref, PhotoQuery query) =>
    ref.watch(photoRepositoryProvider).watchPhotos(query);
