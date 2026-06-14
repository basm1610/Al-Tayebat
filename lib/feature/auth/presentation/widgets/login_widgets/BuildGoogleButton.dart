import 'package:flutter/material.dart';

class BuildGoogleButton extends StatelessWidget {
  const BuildGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

// ignore: unused_element
class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = size.width / 2;
    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: r);

    // Draw colored arcs
    final segments = [
      (0.0, 0.5, const Color(0xFF4285F4)), // Blue
      (0.5, 0.75, const Color(0xFF34A853)), // Green
      (0.75, 0.875, const Color(0xFFFBBC05)), // Yellow
      (0.875, 1.0, const Color(0xFFEA4335)), // Red
    ];

    for (final seg in segments) {
      final paint = Paint()
        ..color = seg.$3
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        rect,
        seg.$1 * 2 * 3.14159,
        (seg.$2 - seg.$1) * 2 * 3.14159,
        false,
        paint,
      );
    }

    // Draw the horizontal bar for G
    final barPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(cx, cy), Offset(cx + r * 0.85, cy), barPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
