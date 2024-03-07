import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/views/widgets/cards/order_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
        itemCount: 10,
        itemBuilder: (context, index) {
          return OrderCard(
              img:
                  'https://m.media-amazon.com/images/I/718fv20h77L._AC_UF1000,1000_QL80_.jpg',
              pName:
                  'Blue Buffalo® True Solutions™ All Life Stages Wet Cat Food - Natural, 3 Oz.',
              qty: '5',
              orderDate: '20 Feb,2024',
              delStatus: 'Dispatched',
              status: 'Completed',
              onTap: () {
                Get.toNamed(AppRoutes.orderDetails);
              });
        });
  }
}
