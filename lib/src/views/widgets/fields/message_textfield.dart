import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageField extends StatelessWidget {
  final TextEditingController controller;
  const MessageField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Message',
              style: Get.textTheme.titleLarge
                  ?.copyWith(height: 2, color: AppColors.primaryText)),
          CustomTextFieldNew(
              isRequired: true,
              minLine: 4,
              maxLine: 6,
              keyboardType: TextInputType.name,
              isNumber: false,
              textInputAction: TextInputAction.next,
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
