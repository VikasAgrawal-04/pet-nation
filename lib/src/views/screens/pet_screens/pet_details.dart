import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  final theme = Get.textTheme;
  final lost = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Pet Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _img(),
            SizedBox(height: 1.5.h),
            _title('Basic Information', () {}),
            _basicInfo(),
            _title('Diet & Prescription', () {}),
            _diet(),
            _petStatus()
          ],
        ),
      ),
    );
  }

  Widget _petStatus() {
    return Row(children: [
      Text('Pet Status', style: theme.bodyLarge),
      const Spacer(),
      Text('Pet Lost', style: theme.titleMedium),
      Obx(() => CupertinoSwitch(
          trackColor: AppColors.hexToColor('#808080'),
          activeColor: Colors.red,
          value: lost.value,
          onChanged: (val) {
            lost.toggle.call();
          }))
    ]);
  }

  Widget _title(String title, Function() ontap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.bodyLarge,
        ),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset('assets/icons/edit.svg'))
      ],
    );
  }

  Widget _basicInfo() {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          _row(
              svg1: 'assets/icons/pet.svg',
              svg2: 'assets/icons/gender.svg',
              title1: 'Name',
              title2: 'Sex',
              value1: 'Charlie',
              value2: 'Male'),
          _row(
              svg1: 'assets/icons/dna.svg',
              svg2: 'assets/icons/pet-2.svg',
              title1: 'Breed',
              title2: 'Species',
              value1: 'Golden Retriever',
              value2: 'Dog'),
          _row(
              svg1: 'assets/icons/calendar.svg',
              svg2: 'assets/icons/weight.svg',
              title1: 'Date Of Birth',
              title2: 'Weight',
              value1: '20/10/2020',
              value2: '65lbs')
        ],
      ),
    );
  }

  Widget _diet() {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(10)),
      child: _row(
          svg1: 'assets/icons/bone.svg',
          svg2: 'assets/icons/medicine.svg',
          title1: 'Food',
          title2: 'Prescription',
          value1: 'Pedigree',
          value2: 'Dogimax 50lbs'),
    );
  }

  Widget _row(
      {required String svg1,
      required String svg2,
      required String title1,
      required String title2,
      required String value1,
      required String value2}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _singleDet(svg1, title1, value1),
      _singleDet(svg2, title2, value2)
    ]);
  }

  Widget _singleDet(String svg, String title, String value) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        child: Row(
          children: [
            SvgPicture.asset(svg, height: 3.5.h),
            SizedBox(width: 2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: theme.titleMedium?.copyWith(fontSize: 16.sp)),
                  Text(value,
                      style: theme.titleMedium?.copyWith(
                          color: AppColors.primaryText, fontSize: 16.sp))
                ],
              ),
            )
          ],
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
            'https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?cs=srgb&dl=pexels-helena-lopes-2253275.jpg&fm=jpg',
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
}
