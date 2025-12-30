import 'dart:ui';

import 'package:flutter/material.dart';

import 'spacing.dart';
import 'theme.dart';

class DSProgressBar extends StatelessWidget {
  const DSProgressBar({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DSSpacing.componentRadius),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 6,
        backgroundColor: DSColors.neutral200,
        valueColor: const AlwaysStoppedAnimation(DSColors.teal500),
      ),
    );
  }
}

class DSGridLoader extends StatefulWidget {
  const DSGridLoader({
    super.key,
    this.size = 24,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  State<DSGridLoader> createState() => _DSGridLoaderState();
}

class _DSGridLoaderState extends State<DSGridLoader>
    with SingleTickerProviderStateMixin {
  static const _delays = [
    0.0,
    0.1,
    0.1,
    0.2,
    0.2,
    0.2,
    0.3,
    0.3,
    0.4,
  ];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _phase(double progress) {
    final normalized = progress * 2;
    return normalized <= 1 ? normalized : 2 - normalized;
  }

  @override
  Widget build(BuildContext context) {
    final loaderColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final squareSize = constraints.maxWidth / 3;

          return Stack(
            children: List.generate(9, (index) {
              final row = index ~/ 3;
              final column = index % 3;
              final delay = _delays[index];

              return Positioned(
                left: column * squareSize,
                top: row * squareSize,
                child: SizedBox(
                  width: squareSize,
                  height: squareSize,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final progress = (_controller.value + delay) % 1.0;
                      final wave = _phase(progress);
                      final scale = lerpDouble(1.0, 0.28, wave)!;
                      final opacity = lerpDouble(0.6, 1.0, wave)!;

                      return Opacity(
                        opacity: opacity,
                        child: Transform.scale(
                          scale: scale,
                          alignment: Alignment.center,
                          child: child,
                        ),
                      );
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: loaderColor,
                        borderRadius: BorderRadius.circular(
                          DSSpacing.componentRadius,
                        ),
                      ),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
