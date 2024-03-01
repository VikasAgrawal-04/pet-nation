import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDown<T> extends StatelessWidget {
  final List<T> items;
  final List<T>? itemValues;
  final T? value;
  final String? title;
  final String hint;
  final String Function(T)? labelBuilder;
  final void Function(T?)? onChanged;
  final bool readOnly;
  const CustomDropDown(
      {required this.items,
      required this.value,
      this.itemValues,
      required this.hint,
      this.onChanged,
      this.labelBuilder,
      this.title,
      this.readOnly = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child:
          title == null ? _buildDropdown() : _buildDropdownWithTitle(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title ?? '',
      style: Get.textTheme.titleLarge
          ?.copyWith(height: 2, color: AppColors.primaryText),
    );
  }

  Widget _buildDropdownWithTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        _buildDropdown(),
      ],
    );
  }

  Widget _buildDropdown() {
    return Opacity(
      opacity: readOnly ? .7 : 1.0,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.hexToColor('#808080')),
            borderRadius: BorderRadius.circular(12.0)),
        child: IgnorePointer(
          ignoring: readOnly,
          child: DropdownButton(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              hint: Text(hint, style: Get.textTheme.titleLarge),
              borderRadius: BorderRadius.circular(10.0),
              items: List.generate(items.length, (index) {
                return _dropdownItem(
                    items[index], (itemValues?[index] ?? items[index]));
              }),
              onChanged: onChanged,
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: value),
        ),
      ),
    );
  }

  DropdownMenuItem<T> _dropdownItem(T e, T v) {
    return DropdownMenuItem<T>(
      value: v,
      child: Text(
        labelBuilder?.call(e) ?? e.toString(),
        style: Get.textTheme.titleLarge?.copyWith(color: AppColors.primaryText),
      ),
    );
  }
}
