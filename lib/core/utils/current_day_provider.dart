import 'dart:async';

import 'package:noodo/core/utils/clock_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_day_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentDay extends _$CurrentDay {
  Timer? _midnightTimer;

  @override
  DateTime build() {
    ref.onDispose(() => _midnightTimer?.cancel());
    _scheduleMidnight();
    return _today();
  }

  void refresh() {
    final today = _today();
    if (today != state) state = today;
    _scheduleMidnight();
  }

  DateTime _today() {
    final now = ref.read(clockProvider)();
    return DateTime(now.year, now.month, now.day);
  }

  void _scheduleMidnight() {
    final now = ref.read(clockProvider)();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    _midnightTimer?.cancel();
    _midnightTimer = Timer(nextMidnight.difference(now), refresh);
  }
}
