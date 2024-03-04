import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';

class PetField extends StatelessWidget {
  final String hint;
  final bool done;
  final bool number;
  final TextEditingController controller;
  const PetField(
      {required this.controller,
      required this.hint,
      this.done = false,
      this.number = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint,
            style: Get.textTheme.titleLarge
                ?.copyWith(height: 2, color: AppColors.primaryText)),
        CustomTextFieldNew(
            isRequired: true,
            keyboardType: number ? TextInputType.number : TextInputType.name,
            isNumber: number,
            textInputAction: done ? TextInputAction.done : TextInputAction.next,
            fillColor: Colors.transparent,
            hint: hint,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.textFieldColor2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.textFieldColor2)),
            control: controller,
            hintStyle: Get.textTheme.titleLarge),
      ],
    );
  }
}
