import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/colored_cards.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_1.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_3.dart';
import 'package:pet_nations/src/views/widgets/rating/ratings.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/titles/title_1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  final theme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Compare Items'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 58.h,
              child: Row(
                children: [
                  compareTitle(),
                  Expanded(
                    flex: 7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 4.w),
                              child: productHeader(
                                'https://www.hillspet.co.id/content/dam/pim/hills/en_id/sd/canned/sd-feline-adult-healthy-cuisine-roasted-chicken-and-rice-medley-canned-productShot_500.png',
                                'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
                              ),
                            ),
                            dividerCon(
                              children: [
                                Ratings(rating: 5, onChange: (value) {}),
                                Text(
                                  '10k Reviews',
                                  style: theme.bodySmall
                                      ?.copyWith(fontSize: 14.5.sp),
                                ),
                              ],
                            ),
                            dividerCon(
                              text: 'Online Store',
                              color: AppColors.secondaryColor,
                            ),
                            dividerCon(
                              text: r'$ 2.39',
                              style: theme.bodyLarge,
                            ),
                            dividerCon(
                              children: [
                                colorCard(AppColors.greenBtn, 'In Stock'),
                              ],
                            ),
                            dividerCon(
                              text: 'Blue Buffalo',
                              color: AppColors.secondaryColor,
                            ),
                            divider(),
                            actionBtns(
                              buyNow: () {},
                              delete: () {},
                              addToCart: () {},
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: Column(
                children: [
                  TitleRow(title: 'Similar Products', onTap: () {}),
                  SizedBox(
                    height: 27.5.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return productCard(
                          pName:
                              'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
                          price: '4.99',
                          img:
                              'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
                          type: 'Supplies',
                          addToCart: () {},
                          buy: () {},
                          seller: 'Online Store',
                        );
                      },
                    ),
                  ),
                  TitleRow(title: 'Products Category', onTap: () {}),
                  _productCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return SizedBox(width: 40.w, child: const Divider(thickness: .4));
  }

  Widget compareTitle() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: Container(
              width: 100.w,
              padding:
                  EdgeInsets.only(left: 2.w, top: 1.h, right: 1.w, bottom: 1.h),
              decoration: BoxDecoration(color: AppColors.compareContainer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.5.h),
                  Expanded(child: Text('Rating', style: theme.bodySmall)),
                  SizedBox(height: 1.5.h),
                  Expanded(child: Text('Sold By', style: theme.bodySmall)),
                  SizedBox(height: 1.5.h),
                  Expanded(child: Text('Price', style: theme.bodySmall)),
                  SizedBox(height: 1.5.h),
                  Expanded(child: Text('Availability', style: theme.bodySmall)),
                  SizedBox(height: 1.5.h),
                  Expanded(child: Text('Brands', style: theme.bodySmall)),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productHeader(String img, String pName) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              width: 35.w,
              height: 15.h,
              child: Column(
                children: [
                  Expanded(child: Image.network(img)),
                  Text(
                    pName,
                    style: theme.bodySmall?.copyWith(fontSize: 14.5.sp),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget dividerCon({
    List<Widget>? children,
    String? text,
    Color? color,
    TextStyle? style,
  }) {
    return Expanded(
      child: SizedBox(
        width: 40.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(thickness: .4),
            if (children != null) ...{...children},
            if (text != null)
              Text(
                text,
                style: style ??
                    theme.bodySmall?.copyWith(fontSize: 14.5.sp, color: color),
              ),
          ],
        ),
      ),
    );
  }

  Widget actionBtns({
    required void Function() buyNow,
    required void Function() delete,
    required void Function() addToCart,
  }) {
    return SizedBox(
      height: 10.h,
      width: 35.w,
      child: Column(
        children: [
          CustomButtonNew(
            height: 4.2.h,
            style: theme.bodySmall?.copyWith(color: AppColors.whiteColor),
            onTap: buyNow,
            text: 'Buy Now',
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Expanded(
                child: CustomButtonNew(
                  height: 4.2.h,
                  onTap: delete,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: .6.h),
                  outlineBtn: true,
                  borderColor: AppColors.secondaryColor,
                  child: SvgPicture.asset(
                    'assets/icons/remove.svg',
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: CustomButtonNew(
                  onTap: addToCart,
                  height: 4.2.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: .6.h),
                  outlineBtn: true,
                  borderColor: AppColors.secondaryColor,
                  child: SvgPicture.asset(
                    'assets/icons/cart.svg',
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
            wishBtn: () {},
          );
        },
      ),
    );
  }
}
