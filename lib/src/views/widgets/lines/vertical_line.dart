import 'package:flutter/material.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';

class VerticalLine extends StatelessWidget {
  final double width;
  const VerticalLine({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VerticalPaint(width: width),
    );
  }
}

class VerticalPaint extends CustomPainter {
  final double width;
  VerticalPaint({required this.width, super.repaint});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
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
