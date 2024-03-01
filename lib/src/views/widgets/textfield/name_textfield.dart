import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/textfield/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;
  const NameField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name',
              style: Get.textTheme.titleLarge
                  ?.copyWith(height: 2, color: AppColors.primaryText)),
          CustomTextFieldNew(
              isRequired: true,
              keyboardType: TextInputType.name,
              isNumber: true,
              textInputAction: TextInputAction.next,
              hint: 'Name',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AppColors.hexToColor('#808080'))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AppColors.hexToColor('#808080'))),
              control: controller,
              hintStyle: Get.textTheme.titleLarge),
        ],
      ),
    );
  }
}
