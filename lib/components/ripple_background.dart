import 'package:flutter/material.dart';
import 'dart:math';

class RippleBackground extends StatelessWidget {
  const RippleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _RipplePainter(),
    );
  }
}

class _RipplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 3);
    final paint = Paint()..color = Colors.teal.withOpacity(0.1);

    for (int i = 1; i <= 5; i++) {
      canvas.drawCircle(center, 60.0 * i, paint..color = paint.color.withOpacity(0.12 - (i * 0.015)));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
