import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = hexToColor('#1E56A1');
  static Color secondaryColor = hexToColor('#008FD5');
  static Color scaffoldPrimaryColor = hexToColor('#FFFFFF');

  //Text Color
  static Color primaryText = hexToColor('#515151');
  static Color secondaryText = hexToColor('#818181');

  //Buttons
  static Color primaryBtn = hexToColor('#1E56A1');
  static Color secondaryBtn = hexToColor('#008FD5');

  //Background Color
  static Color whiteColor = hexToColor('#FFFFFF');
  static Color sliderColor = hexToColor('#D9D9D9');
  static Color blueBg = hexToColor('#F2F9FD');
  static Color selectedSliderColor = hexToColor('#008FD5');
  static Color greyBgColor = hexToColor('#F5F5F5');
  static Color textFieldColor = hexToColor('#F9F9F9');
  static Color borderColor = hexToColor('#818181');


  //Function For Hex To Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
