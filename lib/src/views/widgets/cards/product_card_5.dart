import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProuctCard5 extends StatelessWidget {
  final String img;
  final String type;
  final String items;
  final Function() onTap;
  const ProuctCard5(
      {required this.type,
      required this.img,
      required this.items,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: .8.h, horizontal:4.w),
        decoration: BoxDecoration(
            border: Border.all(width: .5, color: AppColors.borderColor),
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
              child: Image.network(img),
            ),
            SizedBox(height: 1.h),
            Text(type, style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
            SizedBox(height: 1.h),
            Text('$items Items',
                style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}
