import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';

class HalfCircle extends StatelessWidget {
  const HalfCircle({required this.size, super.key});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        painter: HalfCirclePainter(),
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.hexToColor('#E6F4FB');
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 180,
      pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
