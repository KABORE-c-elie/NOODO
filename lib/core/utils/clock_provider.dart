import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock_provider.g.dart';

typedef Clock = DateTime Function();

@Riverpod(keepAlive: true)
Clock clock(Ref ref) => DateTime.now;
