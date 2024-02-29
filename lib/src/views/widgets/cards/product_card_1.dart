import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget productCard(
    {required String img,
    required String type,
    required String pName,
    required Function() buy,
    required Function() addToCart,
    required String seller,
    required String price}) {
  final theme = Get.textTheme;
  return Container(
    width: 80.w,
    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: .2),
        borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Expanded(child: Image.network(img)),
        SizedBox(width: 1.w),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: theme.titleSmall?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 1.h),
              Text(
                pName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.titleLarge?.copyWith(color: AppColors.primaryText),
              ),
              SizedBox(height: 1.h),
              Text(
                'Sold By : $seller',
                style: theme.titleSmall?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 2.h),
              Text('\$ $price',
                  style: theme.displaySmall
                      ?.copyWith(color: AppColors.secondaryColor)),
              SizedBox(height: 2.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: addToCart,
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
                    style: theme.titleMedium?.copyWith(color:AppColors.whiteColor ),
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
