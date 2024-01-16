import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  final BuildContext context;

  HalfCirclePainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF89DEA5)
      ..style = PaintingStyle.fill;

    // Get top padding of the screen
    double topPadding = MediaQuery.of(context).padding.top;

    // Draw the half-circle from the top
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, topPadding - 200),
        radius: 300.0,
      ),
      0,
      3.14, // -π radians (180 degrees) to create a half circle
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
