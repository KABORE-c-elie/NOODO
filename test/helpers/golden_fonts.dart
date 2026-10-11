import 'dart:io';

import 'package:flutter/services.dart';

Future<ByteData> _read(String path) async =>
    ByteData.sublistView(Uint8List.fromList(await File(path).readAsBytes()));

Future<void> loadAppFonts() async {
  final nunito = FontLoader('Nunito');
  for (final weight in ['Regular', 'SemiBold', 'Bold', 'ExtraBold']) {
    nunito.addFont(_read('assets/fonts/Nunito-$weight.ttf'));
  }
  await nunito.load();

  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot == null) return;
  final fonts = '$flutterRoot/bin/cache/artifacts/material_fonts';
  final icons = File('$fonts/materialicons-regular.otf');
  if (await icons.exists()) {
    await (FontLoader('MaterialIcons')..addFont(_read(icons.path))).load();
  }
  final roboto = File('$fonts/roboto-regular.ttf');
  if (await roboto.exists()) {
    await (FontLoader('Roboto')..addFont(_read(roboto.path))).load();
  }
}
