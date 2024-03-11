import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/fields/mobile_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/paw_print-animate.png'),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 1.4,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text('LOGIN', style: theme.displayMedium),
                SizedBox(height: 5.h),
                MobileField(controller: mobile, onEditingComplete: () async {}),
                SizedBox(height: 8.h),
                CustomButtonNew(
                  text: 'Verify OTP',
                  onTap: () {
                    Get.toNamed<void>(AppRoutes.otp);
                  },
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                ),
                SizedBox(height: 5.h),
                Text('Quick Registration With', style: theme.titleMedium),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset('assets/icons/google.svg'),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      child: SvgPicture.asset('assets/icons/apple_logo.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
