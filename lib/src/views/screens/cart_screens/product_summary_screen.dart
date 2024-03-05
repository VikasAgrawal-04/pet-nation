import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/fields/pet_field.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductSummaryScreen extends StatefulWidget {
  const ProductSummaryScreen({super.key});

  @override
  State<ProductSummaryScreen> createState() => _ProductSummaryScreenState();
}

class _ProductSummaryScreenState extends State<ProductSummaryScreen> {
  final theme = Get.textTheme;
  final coupon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Order Summary'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          children: [
            _product(
                'https://www.hillspet.co.id/content/dam/pim/hills/en_id/sd/canned/sd-feline-adult-healthy-cuisine-roasted-chicken-and-rice-medley-canned-productShot_500.png',
                'Canidae® Pure™ Adult Dry Dog Food - Limited Ingredient Diet, Salmon',
                'Online Store'),
            _companyInvoice(),
            CustomButtonNew(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              onTap: () {
                Get.toNamed<void>(AppRoutes.paymentMethod);
              },
              text: 'Proceed To Checkout',
            ),
            _title(
                title: 'Shipping Address',
                text2: 'Change Address',
                onTap: () {}),
            _addressCon(),
            _title(title: 'Payment Details'),
            _payDetails(),
            _applyCoupon()
          ],
        ),
      ),
    );
  }

  Widget _addressCon() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          _singleAddress(
              'Ashok Kumar',
              '2972 Westheimer Rd. Santa Ana, Illinois 85486',
              '9871677905',
              true),
          _singleAddress(
              'Ashok Kumar',
              '2972 Westheimer Rd. Santa Ana, Illinois 85486',
              '9871677905',
              false)
        ],
      ),
    );
  }

  Widget _payDetails() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _payRow('Total Cost', '2.99'),
          _payRow('Tax', '0.00'),
          _payRow('Additional Discount', '0.50', discount: true),
          const Divider(thickness: .5),
          Row(
            children: [
              Text('Total Amount',
                  style:
                      theme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
              const Spacer(),
              Text('\$2.49',
                  style:
                      theme.bodyLarge?.copyWith(color: AppColors.primaryColor))
            ],
          ),
          Text(
            'Shipping fees not included',
            style: theme.titleSmall,
          )
        ],
      ),
    );
  }

  Widget _applyCoupon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(title: 'Apply Coupon'),
        Text('Using a Promo Code?',
            style: theme.titleMedium?.copyWith(fontSize: 16.sp)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
          decoration: BoxDecoration(
              color: AppColors.textFieldColor,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: DefaultField(
                    controller: coupon,
                    hint: 'Enter Your Coupon',
                    title: false,
                  )),
              SizedBox(width: 4.w),
              Expanded(
                  child: CustomButtonNew(
                text: 'Apply',
                onTap: () {},
              ))
            ],
          ),
        )
      ],
    );
  }

  Widget _payRow(String text1, String price, {bool discount = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: Row(children: [
        Text(
          text1,
          style: theme.titleLarge?.copyWith(color: AppColors.primaryText),
        ),
        const Spacer(),
        Text(
          '${discount ? '- ' : ''}\$$price',
          style: theme.titleLarge?.copyWith(color: AppColors.primaryColor),
        )
      ]),
    );
  }

  Widget _singleAddress(String name, String address, String phone, bool value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Checkbox.adaptive(value: value, onChanged: (val) {}),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: theme.bodyLarge),
            SizedBox(height: .5.h),
            Text(address,
                style:
                    theme.titleLarge?.copyWith(color: AppColors.primaryText)),
            SizedBox(height: .5.h),
            Text(
              'Phone Number: +91-$phone',
              style: theme.titleLarge?.copyWith(color: AppColors.primaryText),
            ),
            CustomButtonNew(
              margin: EdgeInsets.only(top: 2.h),
              text: 'Add New Address',
              outlineBtn: true,
              color: Colors.transparent,
              style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              onTap: () {},
            )
          ],
        ))
      ]),
    );
  }

  Widget _title({required String title, Function()? onTap, String? text2}) {
    return Row(children: [
      Text(title, style: theme.displaySmall),
      if (text2 != null) ...{
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            text2,
            style: theme.titleMedium
                ?.copyWith(fontSize: 16.sp, color: AppColors.secondaryColor),
          ),
        )
      }
    ]);
  }

  Widget _product(String img, String pName, String seller) {
    return Row(
      children: [
        Image.network(img, fit: BoxFit.fill, height: 12.h),
        SizedBox(width: 4.w),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pName,
                style: theme.titleLarge
                    ?.copyWith(color: AppColors.primaryText, fontSize: 16.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RichText(
                text: TextSpan(
                    text: 'Sold By ',
                    style: theme.titleMedium,
                    children: [
                      TextSpan(
                          text: seller,
                          style: theme.titleMedium
                              ?.copyWith(color: AppColors.secondaryColor))
                    ]),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _companyInvoice() {
    return Row(children: [
      Checkbox.adaptive(value: true, onChanged: (val) {}),
      Expanded(
        child: Text(
            'Requires company invoice (Please fill in your company information to receive the invoice)?',
            style: theme.titleMedium),
      ),
    ]);
  }
}
