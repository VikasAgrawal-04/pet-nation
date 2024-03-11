import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({required this.title, required this.onTap, super.key});
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Get.textTheme.bodyLarge,
          ),
          CustomButtonNew(
            margin: EdgeInsets.only(right: 2.w),
            height: 5.h,
            width: 25.w,
            text: 'SEE ALL',
            onTap: onTap,
            color: AppColors.tertiaryBtn,
            style: Get.textTheme.bodyMedium
                ?.copyWith(color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
