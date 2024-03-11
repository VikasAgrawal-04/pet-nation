import 'package:flutter/material.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    required this.controller,
    this.onEditingComplete,
    super.key,
    this.style,
  });
  final TextEditingController controller;
  final Future<void> Function()? onEditingComplete;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldNew(
      isRequired: false,
      keyboardType: TextInputType.text,
      isNumber: false,
      textInputAction: TextInputAction.search,
      control: controller,
      fillColor: AppColors.textFieldColor,
      hint: 'Search Product',
      hintStyle: style,
      icon: const Icon(Icons.search),
    );
  }
}
