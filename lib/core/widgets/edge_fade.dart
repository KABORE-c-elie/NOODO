import 'package:flutter/material.dart';
import 'package:noodo/core/theme/app_spacing.dart';

class EdgeFade extends StatelessWidget {
  const EdgeFade({super.key, required this.child, this.width = AppSpacing.xl});

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        final edge = bounds.width == 0
            ? 0.0
            : (width / bounds.width).clamp(0.0, 0.5);
        return LinearGradient(
          colors: const [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0, edge, 1 - edge, 1],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
