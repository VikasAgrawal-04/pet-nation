import 'package:flutter/material.dart';
import 'package:pet_nations/src/views/widgets/cards/pet_product_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllListView extends StatelessWidget {
  const AllListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        itemCount: 16,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .69,
          mainAxisSpacing: 2.h,
          crossAxisSpacing: 4.w,
        ),
        itemBuilder: (context, index) {
          return PetProductCard(
              img:
                  'https://upload.wikimedia.org/wikipedia/commons/4/44/Cat_img.jpg',
              pet: 'Cat',
              onTap: () {});
        });
  }
}
