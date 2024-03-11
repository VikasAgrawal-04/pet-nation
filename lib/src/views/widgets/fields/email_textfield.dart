import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: Get.textTheme.titleLarge
                ?.copyWith(height: 2, color: AppColors.primaryText),
          ),
          CustomTextFieldNew(
            isRequired: true,
            keyboardType: TextInputType.emailAddress,
            isNumber: false,
            textInputAction: TextInputAction.next,
            hint: 'Email',
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
