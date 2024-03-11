import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/fields/pet_field.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({super.key});

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  final theme = Get.textTheme;
  final cardHolderName = TextEditingController();
  final cardNumber = TextEditingController();
  final expiry = TextEditingController();
  final cvv = TextEditingController();
  final save = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Add New Card'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
              decoration: BoxDecoration(
                color: AppColors.textFieldColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  DefaultField(
                    controller: cardHolderName,
                    hint: 'Card Holder Name*',
                  ),
                  SizedBox(height: 1.h),
                  DefaultField(controller: cardNumber, hint: 'Card Number*'),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultField(controller: expiry, hint: 'MM-YY'),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: DefaultField(controller: cvv, hint: 'CVV'),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: save.value,
                          onChanged: (val) {
                            save.toggle();
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'This Card will be saved for future transactions in your saved payment methods',
                          style:
                              theme.titleMedium?.copyWith(letterSpacing: -.1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/icons/visa.svg'),
                SvgPicture.asset('assets/icons/mastercard.svg'),
                SvgPicture.asset('assets/icons/maestro.svg'),
                SvgPicture.asset('assets/icons/rupay.svg'),
              ],
            ),
            SizedBox(height: 1.5.h),
            CustomButtonNew(
              margin: EdgeInsets.symmetric(vertical: 1.5.h),
              text: 'Save And Place Order',
              onTap: () {},
            ),
            CustomButtonNew(
              outlineBtn: true,
              color: Colors.transparent,
              onTap: () {
                Get.back<void>();
              },
              text: 'Cancel',
              style: theme.bodyLarge?.copyWith(color: AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
