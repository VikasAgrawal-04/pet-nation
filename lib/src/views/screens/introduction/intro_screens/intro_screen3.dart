import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroScreenThird extends StatelessWidget {
  const IntroScreenThird({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/dog_cover_3.png', height: 52.h),
              SizedBox(height: 2.5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Get all Supplies Pharmacy for Pet',
                  style: theme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Viverra nunc egestas non imperdiet diam enim. Sed etiam eget morbi phasellus.',
                  style: theme.titleLarge,
                ),
              ),
              const Spacer(),
              CustomButtonNew(
                height: 5.5.h,
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                onTap: () => Get.offAllNamed<void>(AppRoutes.login),
                text: 'Get Started',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
