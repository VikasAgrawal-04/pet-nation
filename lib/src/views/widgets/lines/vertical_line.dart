import 'package:flutter/material.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({required this.width, super.key});
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VerticalPaint(width: width),
    );
  }
}

class VerticalPaint extends CustomPainter {
  VerticalPaint({required this.width, super.repaint});
  final double width;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.borderColor
      ..strokeWidth = .5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    canvas.drawLine(Offset(width, 0), Offset(width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
