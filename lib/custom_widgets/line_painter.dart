import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the start and end points of the line
    final p1 = Offset(15, 5); // Start point (x1, y1)
    final p2 = Offset(375, 5); // End point (x2, y2)

    // Define the paint style
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round; // Rounded line ends

    // Draw the line
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless the line changes
  }
}