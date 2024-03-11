import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final otp = TextEditingController();
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
              child: Image.asset('assets/images/paw_print-animate2.png'),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 1.4,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text('Verify OTP', style: theme.displayMedium),
                SizedBox(height: 1.5.h),
                Text(
                  'Code has been sent to your mobile number',
                  style: theme.titleMedium,
                ),
                SizedBox(height: 8.h),
                Pinput(
                  defaultPinTheme: PinTheme(
                    width: 9.5.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.hexToColor('#3A3B84'),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  preFilledWidget: const Text('-'),
                  onChanged: (value) {
                    otp.text = value;
                  },
                  onCompleted: (value) {},
                  pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                  length: 6,
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      text: "Didn't receive an OTP?  ",
                      style: theme.titleMedium,
                      children: [
                        TextSpan(
                          text: '  Resend OTP',
                          style: theme.titleMedium
                              ?.copyWith(color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomButtonNew(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  text: 'Submit',
                  onTap: () {
                    Get.toNamed<void>(AppRoutes.dashboard);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
