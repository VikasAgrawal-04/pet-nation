import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/category_card.dart';
import 'package:pet_nations/src/views/widgets/cards/product_card_1.dart';
import 'package:pet_nations/src/views/widgets/carousel/custom_carousel.dart';
import 'package:pet_nations/src/views/widgets/lines/bullet_text.dart';
import 'package:pet_nations/src/views/widgets/lines/vertical_line.dart';
import 'package:pet_nations/src/views/widgets/rating/ratings.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final theme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Product Details'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(
                'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon'),
            SizedBox(height: .5.h),
            _metaData(),
            SizedBox(height: 2.5.h),
            _carousel(),
            SizedBox(height: 2.5.h),
            _priceAvail(),
            SizedBox(height: 2.5.h),
            _qty(),
            _actionBtn(),
            SizedBox(height: 2.5.h),
            _title(
                'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon'),
            SizedBox(height: .5.h),
            Text('SKU: 10751005', style: theme.titleMedium),
            SizedBox(height: .5.h),
            Row(
              children: [
                Text('Sold By', style: theme.titleMedium),
                SizedBox(width: 2.w),
                Text('Dogs  Supplies  Dog Treats',
                    style: theme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor)),
              ],
            ),
            Divider(color: AppColors.borderColor, thickness: .2),
            _description(),
            Divider(color: AppColors.borderColor, thickness: .2, height: 4.h),
            _titleRow(title: 'Cat Categories', onTap: () {}),
            _categories(),
            _titleRow(onTap: () {}, title: 'You Might Also Like'),
            _youMightAlsoLike()
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Text(text,
        style: theme.titleMedium?.copyWith(color: AppColors.primaryText));
  }

  Widget _metaData() {
    return Row(
      children: [
        Text('Sold By', style: theme.titleMedium),
        SizedBox(width: 2.w),
        Text('Online Store',
            style: theme.titleMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryColor)),
        SizedBox(height: 2.h, child: VerticalLine(width: 2.w)),
        SizedBox(width: 4.w),
        Ratings(rating: 4.5, onChange: (val) {}),
        SizedBox(width: 2.w),
        Text('10k reviews', style: theme.titleMedium)
      ],
    );
  }

  Widget _carousel() {
    return CustomCarousel(images: const [
      'https://www.hillspet.co.id/content/dam/pim/hills/en_id/sd/canned/sd-feline-adult-healthy-cuisine-roasted-chicken-and-rice-medley-canned-productShot_500.png',
      'https://www.hillspet.com/content/dam/pim/hills/en_us/sd/stew/sd-feline-adult-perfect-weight-roasted-vegetable-chicken-medley-canned-productShot_zoom.jpg',
      'https://cdn.apartmenttherapy.info/image/upload/v1626449812/gen-workflow/product-database/sd-feline-adult-tender-tuna-dinner-canned-productShot_zoom.jpg',
    ], onTap: (index) {}, width: 60.w, fit: BoxFit.contain);
  }

  Widget _priceAvail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('\$ 74.99', style: theme.displaySmall),
      Row(
        children: [
          Text('Availability', style: theme.titleMedium),
          CustomButtonNew(
            margin: EdgeInsets.only(left: 4.w),
            height: 4.h,
            width: 20.w,
            text: 'In Stock',
            color: AppColors.greenBtn,
            style: theme.titleMedium?.copyWith(color: AppColors.greenText),
          )
        ],
      )
    ]);
  }

  Widget _qty() {
    return Row(
      children: [
        Text('Qty', style: theme.titleLarge),
        SizedBox(width: 3.5.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .8.h),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: .05.w),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/minus.svg',
                  height: 2.2.h,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                '0',
                style:
                    theme.bodyLarge?.copyWith(color: AppColors.secondaryText),
              ),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  height: 2.2.h,
                ),
              )
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
            'assets/icons/wish_btn.svg',
            height: 5.h,
          ),
        )
      ],
    );
  }

  Widget _actionBtn() {
    return Row(children: [
      Expanded(
          child: CustomButtonNew(
        height: 5.2.h,
        margin: EdgeInsets.symmetric(vertical: 2.h),
        onTap: () {},
        color: AppColors.tertiaryBtn,
        style: theme.bodyLarge?.copyWith(color: AppColors.secondaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/cart.svg',
              color: AppColors.secondaryColor,
              height: 3.h,
            ),
            SizedBox(width: 2.w),
            Text(
              'Add To Cart',
              style: theme.bodyLarge?.copyWith(color: AppColors.secondaryColor),
            )
          ],
        ),
      )),
      SizedBox(width: 6.w),
      Expanded(
          child: CustomButtonNew(
              height: 5.2.h,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              onTap: () {},
              text: 'Buy Now'))
    ]);
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: theme.bodyMedium
              ?.copyWith(color: AppColors.secondaryText, height: .4.h),
        ),
        Text(
            "Whether you're rewarding your dog for a job well done during training or just want to treat him for being a good boy, BLUE Bits are tasty morsels that will always get his attention!\nBLUE Bits are natural dog training treats that are soft, moist and extremely tasty. Perfect for training and perfect for treating, BLUE Bits are a healthy and nutritious reward that your dog will love.",
            style: theme.titleMedium
                ?.copyWith(fontSize: 15.5.sp, color: AppColors.primaryText)),
        SizedBox(height: 2.5.h),
        bulletText('Item Number', '10751005'),
        bulletText('Food Type', 'Dog Treat'),
        bulletText('Life Stage', 'Puppy'),
        bulletText('Health Consideration', 'Brain Development'),
        bulletText('Flavor', 'Chicken'),
        bulletText('Primary Ingredients', 'Chicken'),
        bulletText('Nutrition Option', 'Natual'),
        bulletText('Package Weight', '4 oz'),
        Text('Ingredients', style: theme.bodyMedium?.copyWith(height: .4.h)),
        Text(
            'Deboned Chicken, Whole Ground Brown Rice, Oatmeal, Maple Syrup, Vegetable Glycerine, Whole Ground Potato, Gelatin, Salt, Flaxseed (natural Source Of Omega 3 And 6 Fatty Acids), Phosphoric Acid (an Acidifier), Natural Smoke Flavor, Salmon Oil (natural Source Of DHA-Docosahexaenoic Acid), Sorbic Acid (a Natural Preservative), Calcium Ascorbate (a Natural Source Of Vitamin C), Citric Acid (a Natural Preservative), Mixed Tocopherols (a Natural Preservative), Rosemary',
            style: theme.titleMedium)
      ],
    );
  }

  Widget _titleRow({required Function() onTap, required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: theme.bodyLarge,
        ),
        CustomButtonNew(
            margin: EdgeInsets.only(right: 4.w),
            height: 5.h,
            width: 25.w,
            text: 'SEE ALL',
            onTap: onTap,
            color: AppColors.tertiaryBtn,
            style: theme.bodyMedium?.copyWith(color: AppColors.secondaryColor))
      ]),
    );
  }

  Widget _categories() {
    return SizedBox(
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
                onTap: () {});
          }),
    );
  }

  Widget _youMightAlsoLike() {
    return SizedBox(
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
                img: 'https://m.media-amazon.com/images/I/81ltSAXl3EL.jpg',
                type: 'Supplies',
                addToCart: () {},
                buy: () {},
                seller: 'Online Store');
          }),
    );
  }
}
