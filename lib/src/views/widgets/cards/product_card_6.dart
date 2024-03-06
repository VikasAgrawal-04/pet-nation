import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard6 extends StatelessWidget {
  final String img;
  final String price;
  final String type;
  final String pName;
  final String seller;
  final Function() cart;
  final Function() buy;
  final Function() wish;
  const ProductCard6(
      {super.key,
      required this.img,
      required this.price,
      required this.type,
      required this.pName,
      required this.seller,
      required this.cart,
      required this.buy,
      required this.wish});

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor, width: .5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: wish,
              child: SvgPicture.asset('assets/icons/wish_btn.svg'),
            ),
          ),
          Image.network(img, height: 12.h, width: 100.w),
          Text('\$$price', style: theme.displaySmall),
          Text(type, style: theme.titleSmall),
          SizedBox(height: .5.h),
          Text(pName,
              style: theme.titleMedium
                  ?.copyWith(fontSize: 15.5.sp, color: AppColors.primaryText),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          SizedBox(height: .5.h),
          Row(
            children: [
              Text('Sold By', style: theme.titleMedium),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  seller,
                  style: theme.titleMedium?.copyWith(
                      fontSize: 14.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryColor),
                ),
              ),
            ],
          ),
          SizedBox(height: .5.h),
          Row(
            children: [
              GestureDetector(
                onTap: cart,
                child: SvgPicture.asset(
                  'assets/icons/cart_btn.svg',
                  height: 5.h,
                ),
              ),
              SizedBox(width: 2.w),
              CustomButtonNew(
                height: 5.h,
                width: 20.w,
                text: 'Buy Now',
                onTap: buy,
                style: theme.titleMedium?.copyWith(color: AppColors.whiteColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
