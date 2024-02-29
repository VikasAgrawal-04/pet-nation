import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard3 extends StatelessWidget {
  final String img;
  final String type;
  final String pName;
  final Function() buy;
  final Function() addToCart;
  final Function() wishBtn;
  final String seller;
  final String price;

  const ProductCard3(
      {super.key,
      required this.img,
      required this.type,
      required this.pName,
      required this.buy,
      required this.addToCart,
      required this.wishBtn,
      required this.seller,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Container(
      width: 78.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: AppColors.greyBgColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
                  child: Image.network(
                    img,
                    fit: BoxFit.fitHeight,
                  ))),
          SizedBox(width: 2.w),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: theme.titleSmall?.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: .5.h),
                Text(
                  pName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      theme.titleLarge?.copyWith(color: AppColors.primaryText),
                ),
                SizedBox(height: .5.h),
                Text(
                  'Sold By : $seller',
                  style: theme.titleSmall?.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 1.2.h),
                Text('\$ $price',
                    style: theme.displaySmall
                        ?.copyWith(color: AppColors.secondaryColor)),
                SizedBox(height: 1.2.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: wishBtn,
                      child: SvgPicture.asset(
                        'assets/icons/wish_btn.svg',
                        height: 4.5.h,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    GestureDetector(
                      onTap: addToCart,
                      child: SvgPicture.asset(
                        'assets/icons/cart_btn.svg',
                        height: 4.5.h,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    CustomButtonNew(
                      height: 4.5.h,
                      width: 20.w,
                      text: 'Buy Now',
                      onTap: buy,
                      style: theme.titleMedium
                          ?.copyWith(color: AppColors.whiteColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
