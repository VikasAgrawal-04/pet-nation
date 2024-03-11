import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';

class DefaultField extends StatelessWidget {
  const DefaultField({
    required this.controller,
    required this.hint,
    this.done = false,
    this.number = false,
    this.title = true,
    super.key,
  });
  final String hint;
  final bool done;
  final bool number;
  final bool title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title)
          Text(
            hint,
            style: Get.textTheme.titleLarge
                ?.copyWith(height: 2, color: AppColors.primaryText),
          ),
        CustomTextFieldNew(
          isRequired: true,
          keyboardType: number ? TextInputType.number : TextInputType.name,
          isNumber: number,
          textInputAction: done ? TextInputAction.done : TextInputAction.next,
          fillColor: Colors.transparent,
          hint: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldColor2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldColor2),
          ),
          control: controller,
          hintStyle: Get.textTheme.titleLarge,
        ),
      ],
    );
  }
}
