import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = hexToColor('#1E56A1');
  static Color secondaryColor = hexToColor('#008FD5');
  static Color scaffoldPrimaryColor = hexToColor('#FFFFFF');

  //Text Color
  static Color primaryText = hexToColor('#515151');
  static Color secondaryText = hexToColor('#818181');
  static Color greenText = hexToColor('#34A853');
  static Color redText = hexToColor('#DD3434');
  static Color yellowText = hexToColor('#FFBD00');
  static Color blueText = hexToColor('#3470A8');

  //Buttons
  static Color primaryBtn = hexToColor('#1E56A1');
  static Color secondaryBtn = hexToColor('#008FD5');
  static Color tertiaryBtn = hexToColor('#F1F8FC');
  static Color greenBtn = hexToColor('#EFF8F1');
  static Color blueBtn = hexToColor('#E9EEF3');

  //Background Color
  static Color whiteColor = hexToColor('#FFFFFF');
  static Color sliderColor = hexToColor('#D9D9D9');
  static Color blueBg = hexToColor('#F2F9FD');
  static Color selectedSliderColor = hexToColor('#008FD5');
  static Color greyBgColor = hexToColor('#F5F5F5');
  static Color textFieldColor = hexToColor('#F9F9F9');
  static Color textFieldColor2 = hexToColor('#E1E1E1');
  static Color borderColor = hexToColor('#818181');
  static Color lightGreyColor = hexToColor('#F8F8F8');
  static Color redBg = hexToColor('#FDF3F3');
  static Color compareContainer = hexToColor('#F2F2F2');

  //Function For Hex To Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
