import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_6.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtherProductListView extends StatelessWidget {
  const OtherProductListView({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.displaySmall),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .55,
              mainAxisSpacing: 2.h,
              crossAxisSpacing: 4.w,
            ),
            itemBuilder: (context, index) {
              return ProductCard6(
                img:
                    'https://www.meijer.com/content/dam/meijer/product/0084/02/4314/05/0084024314052_0_A1C1_0200.png',
                price: '1.39',
                type: 'Supplies',
                pName:
                    'Blue Buffalo® Tastefuls™ Wet Cat Food Pate - Natural, Oceanfish & Tuna',
                seller: 'Online Store',
                cart: () {},
                buy: () {},
                wish: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
