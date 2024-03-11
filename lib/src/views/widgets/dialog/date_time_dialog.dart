import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Future<void> dateTime(
  BuildContext context,
  Future<void> Function(DateTime? date) dateCall,
) {
  final theme = Get.textTheme;
  DateTime? date;
  final selectedTime = ''.obs;
  var dateRange = Helpers.generateTime(todayDate: true);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: Colors.white,
        content: SizedBox(
          height: 60.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SfDateRangePicker(
                  minDate: DateTime.now(),
                  selectionColor: AppColors.secondaryColor,
                  todayHighlightColor: AppColors.secondaryColor,
                  showNavigationArrow: true,
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is DateTime) {
                      date = args.value as DateTime;
                      dateRange = Helpers.generateTime(
                        todayDate:
                            (args.value as DateTime).day == DateTime.now().day,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time',
                      style: theme.bodyMedium,
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      width: 100.w,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 2.w,
                        runSpacing: 1.5.h,
                        children: List.generate(dateRange.length, (index) {
                          final val = dateRange[index];
                          return GestureDetector(
                            onTap: () {
                              if (date != null) {
                                selectedTime.value = val;
                              } else {
                                EasyLoading.showInfo(
                                  'Please select a date',
                                );
                              }
                            },
                            child: Obx(
                              () => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 20.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.w,
                                  vertical: 1.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: selectedTime.value == val
                                      ? AppColors.secondaryColor
                                      : AppColors.hexToColor(
                                          '#EFEFF0',
                                        ),
                                ),
                                child: Center(
                                  child: Text(
                                    val,
                                    style: theme.titleMedium?.copyWith(
                                      color: selectedTime.value == val
                                          ? AppColors.whiteColor
                                          : AppColors.primaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButtonNew(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                text: 'Apply',
                onTap: () {
                  if (date != null && selectedTime.value != '') {
                    dateCall(
                      date?.add(
                        Duration(
                          hours: int.parse(
                            selectedTime.value.split(':')[0],
                          ),
                        ),
                      ),
                    );
                    Get.back<void>();
                  } else {
                    EasyLoading.showInfo('Please select a Date & Time');
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
