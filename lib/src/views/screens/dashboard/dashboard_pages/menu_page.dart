import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _menuHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [_orderBody(), _productBody(), _accountBody()],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuHeader() {
    return Row(
      children: [
        CircleAvatar(radius: 21.sp),
        SizedBox(width: 2.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Ashok Kumar',
            style: theme.displaySmall,
          ),
          SizedBox(height: .2.h),
          CustomButtonNew(
            color: AppColors.tertiaryBtn,
            width: 26.w,
            height: 3.5.h,
            text: 'View Profile',
            onTap: () {
              Get.toNamed(AppRoutes.profile);
            },
            style: theme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500, color: AppColors.secondaryColor),
          )
        ]),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/exit.svg',
              color: AppColors.secondaryColor),
        ),
        IconButton(
          onPressed: () {
            dashControl.curIndex.value = dashControl.lstIndex;
          },
          icon: SvgPicture.asset('assets/icons/back.svg'),
        )
      ],
    );
  }

  Widget _orderBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Orders', style: theme.bodyLarge),
          SizedBox(height: .75.h),
          _row('Your Wishlist', 'assets/icons/wishlist.svg', () {
            Get.toNamed(AppRoutes.wishlist);
          }),
          _row('Your Cart', 'assets/icons/cart-2.svg', () {
            dashControl.lstIndex = dashControl.curIndex.value;
            dashControl.curIndex.value = 1;
          }),
          _row('Track Order', 'assets/icons/track.svg', () {
            Get.toNamed(AppRoutes.orders);
          }),
        ],
      ),
    );
  }

  Widget _productBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Products', style: theme.bodyLarge),
          SizedBox(height: .75.h),
          _row('Product Lists', 'assets/icons/order_2.svg', () {
            Get.toNamed(AppRoutes.shopByProduct);
          }),
          _row('Pet Community', 'assets/icons/pet.svg', () {}),
          _row('Pet Profile', 'assets/icons/pet-icon.svg', () {}),
          _row('Lost Pet', 'assets/icons/pet-2.svg', () {}),
          _row('Chat', 'assets/icons/chat.svg', () {}),
        ],
      ),
    );
  }

  Widget _accountBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Setting', style: theme.bodyLarge),
          SizedBox(height: .75.h),
          _row('Languages', 'assets/icons/india.svg', () {}),
          _row('Payment', 'assets/icons/card.svg', () {}),
          _row('Saved Address', 'assets/icons/address.svg', () {}),
          _row('Notification', 'assets/icons/bell.svg', () {
            Get.toNamed(AppRoutes.notification);
          }),
          _row('Customer Support', 'assets/icons/support.svg', () {
            Get.toNamed<void>(AppRoutes.customerSupport);
          }),
          _row('Terms and Conditions', 'assets/icons/terms_conditions.svg',
              () {}),
        ],
      ),
    );
  }

  Widget _row(String title, String svg, Function() onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .65.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(svg),
              SizedBox(width: 4.w),
              Text(title, style: theme.titleLarge),
              const Spacer(),
              Icon(CupertinoIcons.forward,
                  color: AppColors.secondaryColor, size: 16.sp)
            ],
          ),
        ),
      ),
    );
  }
}
