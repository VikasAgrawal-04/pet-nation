import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/constants/colors.dart';

class CustomButtonNew extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? iconColor;
  final TextStyle? style;
  final Function()? onTap;
  final bool? outlineBtn;
  final double? borderRadius;
  final IconData? icon;
  final double? iconSize;
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadows;

  const CustomButtonNew(
      {this.text,
      this.color,
      this.iconColor,
      this.style,
      this.onTap,
      this.outlineBtn,
      this.borderRadius,
      this.icon,
      this.iconSize,
      this.width,
      this.height,
      this.child,
      this.padding,
      this.margin,
      this.shadows,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        height: height ?? 5.5.h,
        width: width ?? 100.w,
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: shadows,
          color: color ?? AppColors.primaryBtn,
          border: Border.all(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        child: child ??
            Center(
              child: Text(
                text ?? "View",
                style: style ??
                    TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor),
                textAlign: TextAlign.center,
              ),
            ),
      ),
    );
  }
}