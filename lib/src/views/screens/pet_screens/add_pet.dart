import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/buttons/dropdown_button.dart';
import 'package:pet_nations/src/views/widgets/fields/date_field.dart';
import 'package:pet_nations/src/views/widgets/fields/pet_field.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final theme = Get.textTheme;
  final name = TextEditingController();
  final breed = TextEditingController();
  final gender = ''.obs;
  final dob = TextEditingController();
  final weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Pet'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _img(),
            SizedBox(height: 1.5.h),
            Text('Basic Information', style: theme.displaySmall),
            _basicInfo(),
            Text('Diet & Prescription', style: theme.displaySmall),
            _deit(),
            CustomButtonNew(text: 'Create Profile', onTap: () {}),
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
        ),
      ],
    );
  }

  Widget _deit() {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CustomDropDown(
            items: const ['Food 1', 'Food 2', 'Food 3'],
            value: null,
            onChanged: (value) {},
            hint: 'Food',
            title: 'Food',
            zeroPadding: true,
          ),
          CustomDropDown(
            items: const ['Prescription 1', 'Prescription 2', 'Prescription 3'],
            value: null,
            onChanged: (value) {},
            hint: 'Prescription',
            title: 'Prescription',
            zeroPadding: true,
          ),
        ],
      ),
    );
  }

  Widget _basicInfo() {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          DefaultField(controller: name, hint: 'Name'),
          DefaultField(controller: breed, hint: 'Breed'),
          Obx(
            () => CustomDropDown(
              items: const ['Male', 'Female'],
              value: gender.value == '' ? null : gender.value,
              onChanged: (value) {
                if (value != null) {
                  gender.value = value;
                }
              },
              hint: 'Gender',
              title: 'Gender',
              zeroPadding: true,
            ),
          ),
          DateTextField(
            hintText: 'Date Of Birth',
            onChanged: (value) {
              dob.text = value;
            },
          ),
          DefaultField(
            controller: weight,
            hint: 'Weight',
            number: true,
          ),
        ],
      ),
    );
  }
}
