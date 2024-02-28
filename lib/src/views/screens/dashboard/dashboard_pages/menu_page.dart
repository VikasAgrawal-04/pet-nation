import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/constants/constant.dart';
import 'package:pet_nations/src/views/widgets/custom_painter/half_circle_painter.dart';
import 'package:pet_nations/src/views/widgets/textfield/search_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.5.h),
          child: AppBar(
            title: SearchField(
              controller: searchControl,
              onEditingComplete: () async {},
            ),
            actions: [
              GestureDetector(
                child: SvgPicture.asset('assets/icons/bell.svg', height: 3.2.h),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        child: Column(
          children: [
            SizedBox(
              height: 68.h,
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  const Color.fromRGBO(129, 129, 129, .1)),
                          borderRadius: BorderRadius.circular(8)),
                      width: 50.w,
                      height: 25.h,
                      child: Column(
                        children: [HalfCircle(size: Size(50.w, 0))],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 2.h),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .06),
                        blurRadius: 10,
                        offset: Offset(0, -5))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.borderColor)),
                    child: Text(Constant.menuItems[index],
                        style: Get.textTheme.titleMedium),
                  );
                }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
