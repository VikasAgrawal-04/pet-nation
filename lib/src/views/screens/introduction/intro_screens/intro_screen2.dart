import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroScreenSecond extends StatelessWidget {
  const IntroScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
 final theme = Get.textTheme;
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/cat_cover.png'),
                SizedBox(height: 2.5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text('Get all supplies for your Cat',
                      style: theme.displayLarge, textAlign: TextAlign.center),
                ),
                SizedBox(height: 2.5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Viverra nunc egestas non imperdiet diam enim. Sed etiam eget morbi phasellus.',
                      style: theme.titleLarge),
                )
              ],
            ),
          )),
    );
  }
}
