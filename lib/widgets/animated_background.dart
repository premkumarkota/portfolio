import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Blob> _blobs = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Initialize random blobs
    for (int i = 0; i < 5; i++) {
      _blobs.add(_Blob.random());
    }
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
          painter: _BackgroundPainter(_blobs, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Blob {
  final double x;
  final double y;
  final double radius;
  final Color color;
  final double speedX;
  final double speedY;

  _Blob({
    required this.x,
    required this.y,
    required this.radius,
    required this.color,
    required this.speedX,
    required this.speedY,
  });

  factory _Blob.random() {
    final random = Random();
    return _Blob(
      x: random.nextDouble(),
      y: random.nextDouble(),
      radius: random.nextDouble() * 300 + 150, // Larger soft blobs
      color: (random.nextBool() ? AppColors.secondary : AppColors.accent)
          .withOpacity(random.nextDouble() * 0.15 + 0.05),
      speedX: (random.nextDouble() - 0.5) * 0.0005, // Slower, more elegant
      speedY: (random.nextDouble() - 0.5) * 0.0005,
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final List<_Blob> blobs;
  final double animationValue;

  _BackgroundPainter(this.blobs, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw Deep Background
    final paint = Paint()..style = PaintingStyle.fill;
    final bgRect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = AppColors.darkGradient.createShader(bgRect);
    canvas.drawRect(bgRect, paint);

    // 2. Draw Subtle Grid Pattern (Tech feel)
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..strokeWidth = 1;

    // Vertical lines
    double gridSize = 40.0;
    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), gridPaint);
    }
    // Horizontal lines
    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), gridPaint);
    }

    // 3. Draw Blobs (Glow effects)
    for (var blob in blobs) {
      // Animate movement consistently
      double scrollX = blob.speedX * animationValue * 5000;
      double scrollY = blob.speedY * animationValue * 5000;

      final dx = (blob.x * size.width + scrollX) % (size.width + 400) - 200;
      final dy = (blob.y * size.height + scrollY) % (size.height + 400) - 200;

      final blobPaint = Paint()
        ..color = blob.color
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

      canvas.drawCircle(Offset(dx, dy), blob.radius, blobPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
