import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/auth_controller.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/models/response/auth/profile_response.dart';
import 'package:pet_nations/src/views/widgets/indicator/loading_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final theme = Get.textTheme;
  final authControl = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back<void>();
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
            icon: SvgPicture.asset('assets/icons/cart.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/exit.svg'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: authControl.fetchProfile(),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyLoadingIndicator();
          } else if (snapshot.data == null) {
            return const Center(child: Text('No Data'));
          } else {
            final data = snapshot.data;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _img(data?.profileImage),
                  _prsnlHeader(),
                  _prsnlBody(data),
                  _payHeader(),
                  _payBody(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _img(String? img) {
    return Stack(
      children: [
        SizedBox(
          width: 100.w,
          height: 22.h,
          child: Image.network(
            img != ''
                ? img.toString()
                : 'https://img.freepik.com/premium-photo/cartoon-character-with-glasses-laptop_7023-101048.jpg',
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

  Widget _prsnlHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(
        children: [
          Text('Personal Details', style: theme.displaySmall),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/edit.svg',
              color: AppColors.secondaryColor,
            ),
          ),
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

  Widget _prsnlBody(ProfileResponse? data) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _row(
            'First Name',
            '${data?.firstName != '' ? data?.firstName : "Eleanor"} ${data?.lastName != '' ? data?.lastName : "Pena"}',
            'assets/icons/profile.svg',
          ),
          _row(
            'Gender',
            data?.gender != '' ? data!.gender : 'Male',
            'assets/icons/gender.svg',
          ),
          _row(
            'Date of Birth',
            data?.dob != '' ? data!.dob : '05/09/1985',
            'assets/icons/calendar.svg',
          ),
          _row(
            'Email Address',
            data?.email != '' ? data!.email : 'eleanor.pena@gmail.com',
            'assets/icons/email.svg',
          ),
          _row(
            'Home Address',
            data?.houseNo != ''
                ? '${data?.floorNo},${data?.houseNo} ${data?.poBox},${data?.city},${data?.country} ${data?.pincode}'
                : '1901 Thornidge Cir, Shiloh, Hawaii 81063',
            'assets/icons/address.svg',
          ),
          _row(
            'Language',
            data?.language != '' ? data!.language : 'English',
            'assets/icons/india.svg',
          ),
        ],
      ),
    );
  }

  Widget _payBody() {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardDetail('Ashok Kumar', '4451 XXXX XXXX XXXX', 'XX/XX'),
          _cardDetail('Ashok Kumar', '8818 XXXX XXXX XXXX', 'XX/XX'),
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
          Text(
            'Card No. : $cardNo',
            style: theme.titleMedium?.copyWith(fontSize: 16.sp),
          ),
          Text(
            'Expire Date : $expiry',
            style: theme.titleMedium?.copyWith(fontSize: 16.sp),
          ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
