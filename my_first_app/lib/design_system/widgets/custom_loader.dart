import 'package:flutter/material.dart';
import '../../theme/colors.dart';

/// Premium animated loader - 3-bar wave animation
/// Design: Sleek, modern, minimalist - inspired by premium apps
class CustomLoader extends StatefulWidget {
  final double size;
  final Color? color;

  const CustomLoader({
    super.key,
    this.size = 40,
    this.color,
  });

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2250), // 3 cycles of 750ms
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.teal500;  // Vibrant teal by default

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _ThreeBarWavePainter(
              animation: _controller.value,
              color: color,
            ),
          );
        },
      ),
    );
  }
}

class _ThreeBarWavePainter extends CustomPainter {
  final double animation;
  final Color color;

  _ThreeBarWavePainter({
    required this.animation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Each bar is 1/4 of the width (6 out of 24 in original SVG)
    final barWidth = size.width / 4;
    final gap = barWidth / 2; // Gap between bars

    // Max and min heights for the bars
    final maxHeight = size.height * 0.92; // 22/24 of total height
    final minHeight = size.height * 0.58; // 14/24 of total height

    // Animation cycle: 0-1 represents the full animation
    // Each bar starts at different times (staggered by 0.15s / 0.75s = 0.2)

    // Draw 3 bars
    for (int i = 0; i < 3; i++) {
      // Calculate staggered animation for this bar
      // Bar 0: starts at 0
      // Bar 1: starts at 0.2 (0.15s / 0.75s)
      // Bar 2: starts at 0.4 (0.30s / 0.75s)
      final stagger = i * 0.2;
      final barAnimation = ((animation * 3) - stagger) % 3.0; // Repeat every 3 cycles

      // Animation goes: 0 -> 1 (grow down), then pause
      // We want smooth loop: 0-1 is one cycle, then restart
      final t = (barAnimation % 1.0).clamp(0.0, 1.0);

      // Interpolate height: maxHeight -> minHeight
      final height = maxHeight - (t * (maxHeight - minHeight));

      // Interpolate y position: small offset -> larger offset
      // When height decreases, y should increase to keep bar moving down
      final yOffset = size.height * 0.04 + (t * size.height * 0.17); // 1->5 out of 24

      // Interpolate opacity: 1.0 -> 0.2
      final opacity = 1.0 - (t * 0.8);

      // X position for each bar
      final x = (i * (barWidth + gap)) + gap / 2;

      // Draw the bar
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, yOffset, barWidth, height),
        const Radius.circular(2),
      );

      final paint = Paint()
        ..color = color.withValues(alpha: opacity)
        ..style = PaintingStyle.fill;

      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(_ThreeBarWavePainter oldDelegate) => true;
}
