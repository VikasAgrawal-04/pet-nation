import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/category_card.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_1.dart';
import 'package:pet_nations/src/views/widgets/titles/title_1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final dashControl = Get.find<DashController>();
  final theme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        dashControl.curIndex.value = dashControl.lstIndex;
        dashControl.lstIndex = 0;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: () {
              dashControl.curIndex.value = dashControl.lstIndex;
              dashControl.lstIndex = 0;
            },
            child: const Icon(CupertinoIcons.back),
          ),
          title: Text(
            'Shopping Cart',
            style: theme.displaySmall,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.5.h),
          child: Column(
            children: [
              _cartProduct(
                'https://cdn11.bigcommerce.com/s-c1f89/images/stencil/226x226/products/304/37559/lpf_dog_-adult_dry_chickenbrownrice__14123.1651842207.png?c=2',
                'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
                'Online Store',
                '4.99',
                '1',
              ),
              _cartProduct(
                'https://www.pedigree.com/sites/g/files/fnmzdf3076/files/migrate-product-files/images/n4zblcwxn936e5xiv0bt.png',
                'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
                'Online Store',
                '4.99',
                '1',
              ),
              _buyBtn(),
              _compareBtn(),
              TitleRow(onTap: () {}, title: 'Cat Categories'),
              SizedBox(
                height: 22.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return categoryCard(
                      img:
                          'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
                      animal: 'Cat',
                      type: 'Dry Food',
                      onTap: () {},
                    );
                  },
                ),
              ),
              TitleRow(onTap: () {}, title: 'You Might Also Like'),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buyBtn() {
    return CustomButtonNew(
      text: 'Buy Now',
      onTap: () {
        Get.toNamed<void>(AppRoutes.productSummary);
      },
    );
  }

  Widget _compareBtn() {
    return CustomButtonNew(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      text: 'Compare',
      onTap: () {
        Get.toNamed<void>(AppRoutes.compare);
      },
      color: AppColors.whiteColor,
      style: theme.titleLarge,
      outlineBtn: true,
    );
  }

  Widget _cartProduct(
    String img,
    String pName,
    String seller,
    String price,
    String qty,
  ) {
    return Container(
      height: 24.h,
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(value: true, onChanged: (val) {}),
                Expanded(child: Image.network(img)),
              ],
            ),
          ),
          SizedBox(width: 1.w),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      theme.titleLarge?.copyWith(color: AppColors.primaryText),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Sold By : $seller',
                  style: theme.titleSmall?.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 2.h),
                Text('\$ $price', style: theme.displaySmall),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      'Qty',
                      style: theme.titleLarge?.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(width: 2.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: .8.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/minus.svg',
                              height: 2.2.h,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            qty,
                            style: theme.bodyLarge
                                ?.copyWith(color: AppColors.secondaryText),
                          ),
                          SizedBox(width: 3.w),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/plus.svg',
                              height: 2.2.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/dlt_btn.svg',
                        height: 5.h,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/shr_btn.svg',
                        height: 5.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
