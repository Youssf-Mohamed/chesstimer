import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedChessBackground extends StatefulWidget {
  const AnimatedChessBackground({super.key});

  @override
  State<AnimatedChessBackground> createState() => _AnimatedChessBackgroundState();
}

class _AnimatedChessBackgroundState extends State<AnimatedChessBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ChessBackgroundPainter(_controller.value),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class ChessBackgroundPainter extends CustomPainter {
  final double animationValue;

  ChessBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // 6 columns across the width of the screen
    final double squareSize = size.width / 6.0;

    // Smoothly transition downwards.
    // The chessboard grid repeats every 2 rows.
    final double offsetY = animationValue * squareSize * 2.0;

    // Elegant, modern light slate/grey colors
    final paintLight = Paint()..color = const Color(0xFFE2E8F0);
    final paintDark = Paint()..color = const Color(0xFFCBD5E1);

    // Number of rows required to fully cover the screen (including off-screen margins for animation)
    final int rows = (size.height / squareSize).ceil() + 3;
    const int cols = 6;

    for (int r = -2; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final double x = c * squareSize;
        final double y = r * squareSize + offsetY;

        // Alternate colors
        final bool isDark = (r + c) % 2 == 0;
        final paint = isDark ? paintDark : paintLight;

        // Draw individual square with a tiny extra pixel overlap to prevent anti-aliasing gaps
        canvas.drawRect(
          Rect.fromLTWH(x, y, squareSize + 0.5, squareSize + 0.5),
          paint,
        );
      }
    }

    // Apply a subtle dark vignette gradient to soften the edges and dim the corners
    final Rect rect = Offset.zero & size;
    final Paint vignettePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.2,
        colors: [
          Colors.transparent,
          Colors.black.withAlpha(15),
          Colors.black.withAlpha(85),
        ],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(rect);

    canvas.drawRect(rect, vignettePaint);
  }

  @override
  bool shouldRepaint(covariant ChessBackgroundPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
