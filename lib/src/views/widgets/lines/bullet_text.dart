import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget bulletText(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.ideographic,
    children: [
      Text(
        '\u2022 ',
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.secondaryText,
        ),
      ),
      SizedBox(width: 4.w),
      RichText(
        text: TextSpan(
          text: '$title: ',
          style: Get.textTheme.titleMedium,
          children: [
            TextSpan(
              text: value,
              style: Get.textTheme.titleMedium
                  ?.copyWith(color: AppColors.primaryText),
            ),
          ],
        ),
      ),
    ],
  );
}
