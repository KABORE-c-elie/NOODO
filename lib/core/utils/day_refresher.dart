import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/utils/current_day_provider.dart';

class DayRefresher extends ConsumerStatefulWidget {
  const DayRefresher({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<DayRefresher> createState() => _DayRefresherState();
}

class _DayRefresherState extends ConsumerState<DayRefresher> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: () => ref.read(currentDayProvider.notifier).refresh(),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
