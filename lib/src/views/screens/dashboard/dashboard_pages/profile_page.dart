import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dashControl = Get.find<DashController>();
  final theme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        dashControl.curIndex.value = dashControl.lstIndex;
        dashControl.lstIndex = 0;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: () {
              dashControl.curIndex.value = dashControl.lstIndex;
              dashControl.lstIndex = 0;
            },
            child: const Icon(CupertinoIcons.back),
          ),
          title: Text(
            'Account Profile',
            style: theme.displaySmall,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/cart.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/exit.svg'))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _img(),
              _prsnlHeader(),
              _prsnlBody(),
              _payHeader(),
              _payBody()
            ],
          ),
        ),
      ),
    );
  }

  Widget _img() {
    return Stack(
      children: [
        SizedBox(
          width: 100.w,
          height: 22.h,
          child: Image.network(
            'https://img.freepik.com/premium-photo/cartoon-character-with-glasses-laptop_7023-101048.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/camera-2.svg'),
          ),
        )
      ],
    );
  }

  Widget _prsnlHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(
        children: [
          Text('Personal Details', style: theme.displaySmall),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/edit.svg',
                color: AppColors.secondaryColor),
          )
        ],
      ),
    );
  }

  Widget _payHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Text('Personal Details', style: theme.displaySmall),
    );
  }

  Widget _prsnlBody() {
    return Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          _row('First Name', 'Eleanor Pena', 'assets/icons/profile.svg'),
          _row('Gender', 'Male', 'assets/icons/gender.svg'),
          _row('Date of Birth', '05/09/1985', 'assets/icons/calendar.svg'),
          _row('Email Address', 'eleanor.pena@gmail.com',
              'assets/icons/email.svg'),
          _row('Home Address', '1901 Thornidge Cir, Shiloh, Hawaii 81063',
              'assets/icons/address.svg'),
          _row('Language', 'English', 'assets/icons/india.svg'),
        ]));
  }

  Widget _payBody() {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardDetail('Ashok Kumar', '4451 XXXX XXXX XXXX', 'XX/XX'),
          _cardDetail('Ashok Kumar', '8818 XXXX XXXX XXXX', 'XX/XX')
        ],
      ),
    );
  }

  Widget _cardDetail(String name, String cardNo, String expiry) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: theme.bodyMedium),
          Text('Card No. : $cardNo',
              style: theme.titleMedium?.copyWith(fontSize: 16.sp)),
          Text('Expire Date : $expiry',
              style: theme.titleMedium?.copyWith(fontSize: 16.sp))
        ],
      ),
    );
  }

  Widget _row(String title, String value, String svg) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .6.h),
      child: Row(
        children: [
          SvgPicture.asset(svg, width: 7.5.w),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.titleMedium),
                Text(
                  value,
                  style: theme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
