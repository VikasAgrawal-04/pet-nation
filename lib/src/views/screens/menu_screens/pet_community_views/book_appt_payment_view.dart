import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookApptPaymentView extends StatefulWidget {
  const BookApptPaymentView({super.key});

  @override
  State<BookApptPaymentView> createState() => _BookApptPaymentViewState();
}

class _BookApptPaymentViewState extends State<BookApptPaymentView> {
  final theme = Get.textTheme;
  final grpVal = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Book Appointment', centerTitle: true, actions: [
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.info))
      ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                serviceDetails(),
                apptDetails(),
                Divider(thickness: .3, height: 2.h),
                Text('Payment Methods',
                    style: theme.titleLarge?.copyWith(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp)),
                cardCon('Credit Card', 'Add Card Payment', 'Credit Card',
                    grpVal.value, (val) {
                  if (val != null) {
                    grpVal.value = val;
                  }
                }),
                cardCon('ACH', 'Bank Details', 'ACH', grpVal.value, (val) {
                  if (val != null) {
                    grpVal.value = val;
                  }
                }),
                CustomButtonNew(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  text: 'Add To Payment',
                  onTap: () {},
                )
              ],
            )),
      ),
    );
  }

  Widget cardCon(String text1, String text2, String radioVal, String grpVal,
      Function(String?) onChanged) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
          border: Border.all(width: .7, color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Radio<String>.adaptive(
              value: radioVal, groupValue: grpVal, onChanged: onChanged),
          SvgPicture.asset('assets/icons/card.svg'),
          SizedBox(width: 6.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: theme.titleMedium
                    ?.copyWith(color: AppColors.primaryText, fontSize: 16.sp),
              ),
              Text(
                text2,
                style: theme.titleMedium,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget serviceDetails() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Image.network(
        'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg&ga=GA1.1.1395880969.1709683200&semt=ais',
        height: 10.h,
      )),
      Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pet Grooming Services',
                  style: theme.titleMedium?.copyWith(
                      fontSize: 16.sp, color: AppColors.primaryColor)),
              Text('Vendor List Vendor XYZ',
                  style: theme.titleMedium
                      ?.copyWith(color: AppColors.primaryText)),
              SizedBox(height: 1.h),
              Text('\$45.99', style: theme.displaySmall)
            ],
          ))
    ]);
  }

  Widget apptDetails() {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.textFieldColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Appointment Date',
              style: theme.titleMedium?.copyWith(fontSize: 16.sp)),
          Text(
            '06 Feb, 2024 11:00 AM',
            style: theme.titleMedium
                ?.copyWith(fontSize: 16.sp, color: AppColors.primaryText),
          )
        ],
      ),
    );
  }
}
