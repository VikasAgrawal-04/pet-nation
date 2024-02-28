import 'package:flutter/material.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldPrimaryColor,
      fontFamily: 'Lato',
      iconTheme: IconThemeData(
        color: AppColors.hexToColor('#515151'),
      ),
      checkboxTheme: CheckboxThemeData(
        side: MaterialStateBorderSide.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide(color: AppColors.primaryColor);
            } else {
              return BorderSide(color: AppColors.hexToColor('#EAEAEA'));
            }
          },
        ),
        checkColor: MaterialStateProperty.all(AppColors.primaryColor),
        fillColor: MaterialStateProperty.all(AppColors.whiteColor),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.hexToColor('#787887');
        }),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.whiteColor,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'Lato',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp),
      ),
      textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 24.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w700),
          displayMedium: TextStyle(
              fontSize: 20.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w700),
          displaySmall: TextStyle(
              fontSize: 18.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w700),
          titleLarge: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText),
          titleMedium: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText),
          titleSmall: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText)));
}
