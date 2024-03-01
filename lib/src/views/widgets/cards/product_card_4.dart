import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard4 extends StatelessWidget {
  final String img;
  final String pName;
  final String price;
  final Function() buy;
  final Function() addToCart;
  final Function() wishBtn;

  const ProductCard4(
      {super.key,
      required this.img,
      required this.pName,
      required this.price,
      required this.buy,
      required this.addToCart,
      required this.wishBtn});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Container(
      width: 75.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: .2),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(child: Image.network(img)),
          SizedBox(width: 2.w),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$ $price',
                      style: theme.displaySmall
                          ?.copyWith(color: AppColors.secondaryColor)),
                  SizedBox(height: 2.h),
                  Text(
                    pName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleLarge?.copyWith(
                        color: AppColors.primaryText, fontSize: 16.sp),
                  ),
                  SizedBox(height: 2.h),
                  Row(children: [
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
                  ])
                ],
              ))
        ],
      ),
    );
  }
}
