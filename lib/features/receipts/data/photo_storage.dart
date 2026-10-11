import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

const photoImageQuality = 70;
const photoMaxWidth = 1600.0;
const _photoFolder = 'receipts';

abstract interface class PhotoStorage {
  Future<String?> capture();

  Future<void> delete(String fileName);

  ImageProvider imageFor(String fileName);
}

final class DevicePhotoStorage implements PhotoStorage {
  DevicePhotoStorage._(this._directory, this._picker);

  static Future<DevicePhotoStorage> open({ImagePicker? picker}) async {
    final documents = await getApplicationDocumentsDirectory();
    final directory = Directory(p.join(documents.path, _photoFolder));
    await directory.create(recursive: true);
    return DevicePhotoStorage._(directory, picker ?? ImagePicker());
  }

  static const _uuid = Uuid();

  final Directory _directory;
  final ImagePicker _picker;

  @override
  Future<String?> capture() async {
    final picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: photoImageQuality,
      maxWidth: photoMaxWidth,
    );
    if (picked == null) return null;
    final fileName = '${_uuid.v4()}.jpg';
    await File(picked.path).copy(p.join(_directory.path, fileName));
    return fileName;
  }

  @override
  Future<void> delete(String fileName) async {
    final file = File(p.join(_directory.path, fileName));
    if (await file.exists()) await file.delete();
  }

  @override
  ImageProvider imageFor(String fileName) =>
      FileImage(File(p.join(_directory.path, fileName)));
}
