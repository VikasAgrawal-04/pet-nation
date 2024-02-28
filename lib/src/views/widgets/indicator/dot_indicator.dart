import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DotIndicator extends StatelessWidget {
  final RxInt curIndex;
  const DotIndicator({required this.curIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1.2.w,
      children: List.generate(3, (index) {
        return Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.only(top: 0.5.h),
              height: 1.2.h,
              width: curIndex.value == index ? 8.w : 2.5.w,
              decoration: BoxDecoration(
                  color: AppColors.sliderColor,
                  borderRadius: BorderRadius.circular(20)),
            ));
      }),
    );
  }
}
