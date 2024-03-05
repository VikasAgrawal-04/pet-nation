import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final theme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Payment Methods'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          children: [
            cardDetails('Ashok Kumar', '4515 XXXX XXXX XXXX', 'XX/XX', true),
            cardDetails('Ashok Kumar', '4515 XXXX XXXX XXXX', 'XX/XX', false),
            CustomButtonNew(
              outlineBtn: true,
              color: Colors.transparent,
              onTap: () {
                Get.toNamed(AppRoutes.newCard);
              },
              text: 'Add New Card',
              style: theme.bodyLarge?.copyWith(color: AppColors.secondaryColor),
            ),
            CustomButtonNew(
              margin: EdgeInsets.symmetric(vertical: 1.5.h),
              text: 'Place Order',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget cardDetails(String name, String cardNo, String expiry, bool value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(value: value, onChanged: (val) {}),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: theme.bodyMedium),
              Text('Card No. : $cardNo',
                  style: theme.titleMedium?.copyWith(fontSize: 16.sp)),
              Text('Expire Date : $expiry',
                  style: theme.titleMedium?.copyWith(fontSize: 16.sp))
            ],
          ))
        ],
      ),
    );
  }
}
