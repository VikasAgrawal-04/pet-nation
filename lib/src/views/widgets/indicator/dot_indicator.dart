import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    required this.curIndex,
    this.color = false,
    this.length,
    super.key,
  });
  final RxInt curIndex;
  final bool color;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1.2.w,
      children: List.generate(length ?? 3, (index) {
        return Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: EdgeInsets.only(top: 0.5.h),
            height: 1.2.h,
            width: curIndex.value == index ? 8.w : 2.5.w,
            decoration: BoxDecoration(
              color: color
                  ? curIndex.value == index
                      ? AppColors.secondaryColor
                      : AppColors.sliderColor
                  : AppColors.sliderColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      }),
    );
  }
}
