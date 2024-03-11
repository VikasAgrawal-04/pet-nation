import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/constants/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget bottomNav({required void Function(int index) onTap}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
    margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 1.5.h),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          blurRadius: 30,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ],
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
    ),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: SvgPicture.asset(
              Constant.icons[index],
              color: Colors.white,
              height: 4.h,
            ),
          ),
        ),
      ),
    ),
  );
}
