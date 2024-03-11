import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/cards/colored_cards.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    required this.img,
    required this.pName,
    required this.qty,
    required this.orderDate,
    required this.delStatus,
    required this.status,
    super.key,
    this.onTap,
    this.track = false,
    this.price,
  });
  final String img;
  final String pName;
  final String qty;
  final String orderDate;
  final String delStatus;
  final String status;
  final void Function()? onTap;
  final bool track;
  final String? price;

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Image.network(img, height: 6.h)),
            SizedBox(width: 4.w),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleMedium?.copyWith(
                      color: AppColors.primaryText,
                      fontSize: 15.5.sp,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qty: $qty',
                        style: theme.titleMedium?.copyWith(fontSize: 15.5.sp),
                      ),
                      Visibility(
                        visible: !track,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.topCenter,
                          ),
                          onPressed: onTap,
                          child: Text(
                            'View Details',
                            style: theme.titleMedium?.copyWith(
                              color: AppColors.secondaryColor,
                              fontSize: 15.5.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (track) ...{
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Text('\$ $price', style: theme.displaySmall),
                    ),
                  },
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              col('Ordered Date', orderDate, theme),
              col('Delivery Status', delStatus, theme),
              colorCard(
                status == 'Ongoing'
                    ? AppColors.greenBtn
                    : status == 'Completed'
                        ? AppColors.blueBtn
                        : AppColors.redBg,
                status,
                size: 15.5,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ),
        const Divider(thickness: .4),
      ],
    );
  }

  Widget col(String title, String value, TextTheme theme) {
    return Column(
      children: [
        Text(
          title,
          style: theme.titleSmall?.copyWith(fontSize: 13.5.sp),
        ),
        Text(
          value,
          style: theme.titleMedium
              ?.copyWith(color: AppColors.primaryText, fontSize: 15.5.sp),
        ),
      ],
    );
  }
}
