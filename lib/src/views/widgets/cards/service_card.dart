import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ServiceCard extends StatelessWidget {
  final String img;
  final String title;
  const ServiceCard({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;

    return Container(
      width: 35.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: .5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SvgPicture.asset(img, height: 4.5.h),
          SizedBox(height: 1.h),
          Text(title, style: theme.titleLarge?.copyWith(fontSize: 16.sp)),
          SizedBox(height: 1.h),
          Text(title,
              style:
                  theme.titleMedium?.copyWith(color: AppColors.secondaryColor)),
        ],
      ),
    );
  }
}
