import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TabBar customTabar(List<String> tabs, {bool scroll = false}) {
  final theme = Get.textTheme;
  return TabBar(
    splashFactory: NoSplash.splashFactory,
    tabAlignment: scroll ? TabAlignment.start : null,
    isScrollable: scroll,
    dividerHeight: 0,
    padding: EdgeInsets.only(top: 1.h),
    indicatorPadding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: .6.h),
    labelStyle: theme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
    indicatorSize: TabBarIndicatorSize.tab,
    unselectedLabelColor: AppColors.primaryText,
    labelColor: AppColors.whiteColor,
    indicatorColor: AppColors.primaryColor,
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: AppColors.primaryColor),
    tabs: tabs.map((e) => Tab(text: e)).toList(),
  );
}
