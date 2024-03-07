import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/constants/constant.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_2.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_3.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_4.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_5.dart';
import 'package:pet_nations/src/views/widgets/cards/service_card.dart';
import 'package:pet_nations/src/views/widgets/carousel/custom_carousel.dart';
import 'package:pet_nations/src/views/widgets/fields/search_textfield.dart';
import 'package:pet_nations/src/views/widgets/titles/title_1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchControl = TextEditingController();
  final theme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(100.w, 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: AppBar(
              leading: Image.asset(
                'assets/images/dog_splash.png',
                fit: BoxFit.scaleDown,
                scale: 1.5,
              ),
              title: SearchField(
                controller: searchControl,
                onEditingComplete: () async {},
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed<void>(AppRoutes.notification);
                  },
                  child:
                      SvgPicture.asset('assets/icons/bell.svg', height: 3.2.h),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            _secondHeader(),
            _carousel(),
            TitleRow(onTap: () {}, title: 'Deals for you'),
            _deals(),
            Divider(color: AppColors.borderColor, thickness: .5),
            TitleRow(onTap: () {}, title: 'Product Category'),
            _productCategory(),
            TitleRow(onTap: () {}, title: 'Top Selling'),
            _topSelling(),
            TitleRow(onTap: () {}, title: 'Pet Services'),
            _petServices(),
            TitleRow(onTap: () {}, title: 'Pet Favorites'),
            _petFavorites()
          ],
        ),
      ),
    );
  }

  Widget _secondHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      height: 10.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 22.w,
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://img.freepik.com/premium-photo/puppies-golden-retriever_1015979-1067.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Dogs',
                    style: theme.titleMedium
                        ?.copyWith(color: AppColors.primaryText),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _carousel() {
    return CustomCarousel(
        images: const [
          'https://img.freepik.com/premium-photo/puppies-golden-retriever_1015979-1067.jpg',
          'https://img.freepik.com/premium-photo/puppies-golden-retriever_1015979-1067.jpg',
          'https://img.freepik.com/premium-photo/puppies-golden-retriever_1015979-1067.jpg',
          'https://img.freepik.com/premium-photo/puppies-golden-retriever_1015979-1067.jpg'
        ],
        onTap: (index) {
          Get.toNamed(AppRoutes.productDetails);
        });
  }

  Widget _deals() {
    return Wrap(
      children: List.generate(4, (index) {
        return ProductCard2(
            img: 'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
            animal: 'Cat',
            type: 'Dry Food',
            price: '24.99',
            onTap: () {});
      }),
    );
  }

  Widget _productCategory() {
    return SizedBox(
      height: 26.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductCard3(
              pName:
                  'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
              price: '4.99',
              img: 'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
              type: 'Supplies',
              addToCart: () {},
              buy: () {},
              seller: 'Online Store',
              wishBtn: () {
                Get.toNamed<void>(AppRoutes.wishlist);
              },
            );
          }),
    );
  }

  Widget _topSelling() {
    return SizedBox(
      height: 21.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductCard4(
              pName:
                  'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
              price: '4.99',
              img: 'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
              addToCart: () {},
              buy: () {},
              wishBtn: () {},
            );
          }),
    );
  }

  Widget _petServices() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      height: 15.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Constant.serviceSvg.length,
          itemBuilder: ((context, index) {
            final obj = Constant.serviceSvg[index];

            return ServiceCard(img: obj['img'], title: obj['name']);
          })),
    );
  }

  Widget _petFavorites() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      height: 16.8.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProuctCard5(
              type: 'Cat Dry Food',
              items: '5',
              onTap: () {},
              img: 'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
            );
          }),
    );
  }
}
