import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/buttons/dropdown_button.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookApptView extends StatefulWidget {
  const BookApptView({super.key});

  @override
  State<BookApptView> createState() => _BookApptViewState();
}

class _BookApptViewState extends State<BookApptView> {
  final theme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Book Appointment', centerTitle: true, actions: [
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.info))
      ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Online Booking', style: theme.displaySmall),
            Text(
                'Lorem ipsum dolor sit amet consectetur. At pellentesque pretium amet libero habitant. Vitae diam egestas vivamus eget dui mattis velit condimentum.',
                style: theme.titleMedium
                    ?.copyWith(color: AppColors.primaryText, fontSize: 16.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            SizedBox(height: 1.h),
            const CustomDropDown(
              items: [],
              value: null,
              hint: 'Pet Categories',
              title: 'Pet Categories',
              zeroPadding: true,
            ),
            SizedBox(height: 1.h),
            const CustomDropDown(
              items: [],
              value: null,
              hint: 'Select Pet',
              title: 'Select Pet',
              zeroPadding: true,
            ),
            SizedBox(height: 1.h),
            const CustomDropDown(
              items: [],
              value: null,
              hint: 'Vendor List',
              title: 'Vendor List',
              zeroPadding: true,
            ),
            CustomButtonNew(
                margin: EdgeInsets.only(top: 2.h),
                text: 'Book Appointment',
                onTap: () {
                  Get.toNamed(AppRoutes.apptPay);
                }),
            CustomButtonNew(
                margin: EdgeInsets.only(top: 2.h),
                text: 'Remind Me',
                borderColor: AppColors.secondaryColor,
                outlineBtn: true,
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
