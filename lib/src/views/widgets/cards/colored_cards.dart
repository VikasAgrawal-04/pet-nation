import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget colorCard(Color color, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .5.h),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
    child: Text(
      text,
      style: Get.textTheme.bodySmall?.copyWith(
          fontSize: 14.5.sp,
          color: color == AppColors.greenBtn
              ? AppColors.greenText
              : color == AppColors.redBg
                  ? AppColors.redText
                  : AppColors.yellowText),
    ),
  );
}
