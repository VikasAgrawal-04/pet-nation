import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileField extends StatelessWidget {
  const MobileField({
    required this.controller,
    this.onEditingComplete,
    super.key,
  });
  final TextEditingController controller;
  final Future<void> Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile Number',
            style: Get.textTheme.titleLarge?.copyWith(height: 2),
          ),
          CustomTextFieldNew(
            prefIcon: SvgPicture.asset(
              'assets/icons/india.svg',
              fit: BoxFit.scaleDown,
            ),
            isRequired: true,
            keyboardType: TextInputType.number,
            isNumber: true,
            textInputAction: TextInputAction.done,
            onEditingComplete: onEditingComplete,
            hint: 'Mobile Number',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.hexToColor('#808080')),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.hexToColor('#808080')),
            ),
            control: controller,
            hintStyle: Get.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
