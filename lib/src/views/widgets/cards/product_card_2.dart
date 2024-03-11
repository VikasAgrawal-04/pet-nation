import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({
    required this.img,
    required this.animal,
    required this.type,
    required this.price,
    required this.onTap,
    super.key,
  });
  final String img;
  final String animal;
  final String type;
  final String price;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
        decoration: BoxDecoration(
          color: AppColors.greyBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .5.h),
              height: 12.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(img),
            ),
            SizedBox(height: .2.h),
            Text(animal, style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
            SizedBox(height: .2.h),
            Text(type, style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
            SizedBox(height: .5.h),
            Text(
              '\$$price',
              style: theme.bodyLarge?.copyWith(color: AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
