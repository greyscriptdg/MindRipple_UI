import 'package:flutter/material.dart';
import 'dart:math';

class RippleBackground extends StatelessWidget {
  const RippleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _RipplePainter(brightness: Theme.of(context).brightness),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final Brightness brightness;

  _RipplePainter({required this.brightness});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 3);
    final baseColor = brightness == Brightness.dark
        ? Colors.tealAccent.withOpacity(0.12)
        : Colors.teal.withOpacity(0.10);
    final paint = Paint()..color = baseColor;

    for (int i = 1; i <= 5; i++) {
      canvas.drawCircle(center, 60.0 * i, paint..color = baseColor.withOpacity((0.12 - (i * 0.015)).clamp(0.02, 0.12)));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
