import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetProductCard extends StatelessWidget {
  final String img;
  final String pet;
  final Function() onTap;
  const PetProductCard(
      {super.key, required this.img, required this.pet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: .5),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Image.network(img, height: 18.h, fit: BoxFit.fitHeight),
          SizedBox(height: 1.5.h),
          Text(pet, style: theme.bodyMedium),
          TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onTap,
              child: Text(
                'View Products',
                style: theme.bodyMedium?.copyWith(
                    fontSize: 15.5.sp, color: AppColors.secondaryColor),
              ))
        ],
      ),
    );
  }
}
