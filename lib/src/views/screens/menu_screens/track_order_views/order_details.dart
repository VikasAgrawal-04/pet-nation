import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/order_card.dart';
import 'package:pet_nations/src/views/widgets/lines/vertical_line.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final theme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Track Order', centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          children: [
            const OrderCard(
              img:
                  'https://m.media-amazon.com/images/I/718fv20h77L._AC_UF1000,1000_QL80_.jpg',
              pName:
                  'Blue Buffalo® True Solutions™ All Life Stages Wet Cat Food - Natural, 3 Oz.',
              qty: '5',
              orderDate: '20 Feb,2024',
              delStatus: 'Dispatched',
              status: 'Completed',
              track: true,
              price: '0.76',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox.adaptive(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(horizontal: -4),
                    value: false,
                    onChanged: (val) {}),
                SizedBox(width: 4.w),
                Text('Out For Delivery',
                    style: theme.bodyLarge
                        ?.copyWith(color: AppColors.secondaryText))
              ],
            ),
            tracking(),

            CustomButtonNew(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              height: 5.h,
              text: 'Continue Shopping',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget tracking() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          check(5),
          SizedBox(width: 4.w),
          Column(children: [
            col('Sat, 14’ Oct ’22 - 4', 'Your Order has been placed.', theme),
            col('Sat, 14’ Oct ’22 - 4', 'Your Order has been placed.', theme),
            col('Sat, 14’ Oct ’22 - 4', 'Your Order has been placed.', theme),
            col('Sat, 14’ Oct ’22 - 4', 'Your Order has been placed.', theme),
            col('Sat, 14’ Oct ’22 - 4', 'Your Order has been placed.', theme)
          ]),
        ],
      ),
    );
  }

  Widget check(int count) {
    return Column(
      children: List.generate(
          count,
          (index) => Column(
                children: [
                  SvgPicture.asset('assets/icons/check.svg', height: 3.2.h),
                  SizedBox(height: 5.h, child: const VerticalLine(width: 1))
                ],
              )),
    );
  }

  Widget col(String title, String value, TextTheme theme) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        value,
        style: theme.titleMedium
            ?.copyWith(color: AppColors.primaryText, fontSize: 15.5.sp),
      ),
      Text(
        title,
        style: theme.titleSmall?.copyWith(fontSize: 13.5.sp),
      ),
      SizedBox(height: 3.5.h)
    ]);
  }
}
