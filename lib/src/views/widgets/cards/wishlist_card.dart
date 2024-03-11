import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/colored_cards.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    required this.check,
    required this.img,
    required this.amount,
    required this.pName,
    required this.seller,
    required this.share,
    required this.delete,
    required this.cart,
    required this.buy,
    required this.checkChange,
    super.key,
  });
  final bool check;
  final String img;
  final String amount;
  final String pName;
  final String seller;
  final void Function() share;
  final void Function() delete;
  final void Function() cart;
  final void Function() buy;
  final void Function(bool? val) checkChange;

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor, width: .4),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox.adaptive(value: check, onChanged: checkChange),
              SizedBox(width: 16.w),
              Image.network(
                img,
                height: 17.h,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '\$$amount',
                      style: theme.displayMedium,
                    ),
                    SizedBox(width: 4.w),
                    colorCard(AppColors.greenBtn, 'In Stock', size: 15.5.sp),
                    const Spacer(),
                    GestureDetector(
                      onTap: share,
                      child: SvgPicture.asset(
                        'assets/icons/shr_btn.svg',
                        height: 4.2.h,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: delete,
                      child: SvgPicture.asset(
                        'assets/icons/dlt_btn.svg',
                        height: 4.2.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  pName,
                  style: theme.titleLarge
                      ?.copyWith(fontSize: 16.sp, color: AppColors.primaryText),
                ),
                Row(
                  children: [
                    Text(
                      'Sold By',
                      style: theme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      seller,
                      style: theme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButtonNew(
                        height: 5.2.h,
                        onTap: cart,
                        color: AppColors.tertiaryBtn,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/cart.svg',
                              color: AppColors.secondaryColor,
                              height: 3.h,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Add To Cart',
                              style: theme.bodyMedium
                                  ?.copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: CustomButtonNew(
                        style: theme.bodyMedium
                            ?.copyWith(color: AppColors.whiteColor),
                        height: 5.2.h,
                        onTap: buy,
                        text: 'Buy Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
