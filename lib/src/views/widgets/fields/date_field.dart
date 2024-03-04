import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:pet_nations/src/views/widgets/fields/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DateTextField extends StatefulWidget {
  final String? hintText;
  final DateTime? initDate;
  final DateTime? firstDate;
  final String? value;
  final DateTime? lasDate;
  final bool? isRequired;

  final ValueChanged<String>? onChanged;
  const DateTextField(
      {this.initDate,
      this.firstDate,
      this.lasDate,
      this.value,
      this.hintText,
      this.onChanged,
      this.isRequired,
      super.key});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.value != null) {
        controller.text = widget.value.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintText.toString(),
            style: Get.textTheme.titleLarge
                ?.copyWith(height: 2, color: AppColors.primaryText)),
        CustomTextFieldNew(
          isRequired: widget.isRequired ?? true,
          control: controller,
          keyboardType: TextInputType.none,
          isNumber: false,
          textInputAction: TextInputAction.none,
          isReadOnly: true,
          icon: Icon(
            CupertinoIcons.calendar_today,
            size: 3.h,
            color: AppColors.hexToColor('#808080'),
          ),
          hint: widget.hintText,
          hintStyle: Get.textTheme.titleLarge,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.textFieldColor2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.textFieldColor2)),
          textFieldTap: () async {
            final date = await showDatePicker(
                context: context,
                firstDate: widget.firstDate ?? DateTime(1950),
                initialDate: widget.initDate ?? DateTime.now(),
                lastDate: widget.lasDate ??
                    DateTime.now().add(const Duration(days: 365)));
            if (date != null) {
              controller.text = Helpers.displayDate(date);
              widget.onChanged?.call(controller.text);
            }
          },
        ),
      ],
    );
  }
}
