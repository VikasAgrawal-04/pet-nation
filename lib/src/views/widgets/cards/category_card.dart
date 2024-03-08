import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget categoryCard(
    {required String img,
    required String animal,
    required String type,
    required Function() onTap}) {
  final theme = Get.textTheme;
  return Container(
    width: 43.w,
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: Column(children: [
      SizedBox(
        height: 12.h,
        child: Image.network(img),
      ),
      SizedBox(height: .2.h),
      Text(animal, style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
      SizedBox(height: .2.h),
      Text(type, style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
      SizedBox(height: .2.h),
      GestureDetector(
        onTap: onTap,
        child: Text('View Items',
            style: theme.titleLarge
                ?.copyWith(fontSize: 16.sp, color: AppColors.secondaryColor)),
      )
    ]),
  );
}
