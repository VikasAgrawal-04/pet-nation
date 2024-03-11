import 'package:flutter/material.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/category_card.dart';
import 'package:pet_nations/src/views/widgets/cards/wishlist_card.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/titles/title_1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Wishlisting'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          children: [
            WishlistCard(
              check: true,
              img:
                  'https://www.purina.ca/sites/default/files/styles/social_share_large/public/friskies-wet-cat-pate-chicken-dinner.png?itok=GShw8pbg',
              amount: '0.76',
              pName:
                  'Purina® Friskies® All Life Stages Cat Wet Food - 6.04 oz.',
              seller: 'Online Seller',
              share: () {},
              delete: () {},
              cart: () {},
              buy: () {},
              checkChange: (val) {},
            ),
            WishlistCard(
              check: true,
              img:
                  'https://cdn11.bigcommerce.com/s-vmvni2zq0j/images/stencil/1280x1280/products/52898/82151/21000518__71208.1622815093.png?c=2',
              amount: '4.99',
              pName: 'Blue Buffalo® Puppy Treat Dog Treats - Natural, Beef',
              seller: 'Online Seller',
              share: () {},
              delete: () {},
              cart: () {},
              buy: () {},
              checkChange: (val) {},
            ),
            WishlistCard(
              check: true,
              img:
                  'https://www.purina.ca/sites/default/files/styles/social_share_large/public/friskies-wet-cat-pate-chicken-dinner.png?itok=GShw8pbg',
              amount: '0.76',
              pName:
                  'Purina® Friskies® All Life Stages Cat Wet Food - 6.04 oz.',
              seller: 'Online Seller',
              share: () {},
              delete: () {},
              cart: () {},
              buy: () {},
              checkChange: (val) {},
            ),
            CustomButtonNew(text: 'Proceed To Checkout', onTap: () {}),
            SizedBox(height: 1.h),
            CustomButtonNew(text: 'Compare', onTap: () {}, outlineBtn: true),
            TitleRow(title: 'Cat Categories', onTap: () {}),
            SizedBox(
              height: 22.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return categoryCard(
                    img: 'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
                    animal: 'Cat',
                    type: 'Dry Food',
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
