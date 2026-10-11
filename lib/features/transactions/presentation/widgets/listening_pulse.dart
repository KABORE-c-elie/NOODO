import 'package:flutter/material.dart';

class ListeningPulse extends StatefulWidget {
  const ListeningPulse({super.key, required this.size});

  final double size;

  @override
  State<ListeningPulse> createState() => _ListeningPulseState();
}

class _ListeningPulseState extends State<ListeningPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller
        ..stop()
        ..value = 0.5;
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        return Container(
          width: widget.size * (0.7 + 0.3 * progress),
          height: widget.size * (0.7 + 0.3 * progress),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.35 * (1 - progress)),
          ),
        );
      },
    );
  }
}
