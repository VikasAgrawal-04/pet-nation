import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetPage extends StatefulWidget {
  const PetPage({super.key});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
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
          centerTitle: true,
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
            'My Pet',
            style: theme.displaySmall,
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.search))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
          child: Column(
            children: [
              ...List.generate(5, (index) {
                return Column(
                  children: [
                    _pet(
                        img:
                            'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/rockcms/2022-08/220805-border-collie-play-mn-1100-82d2f1.jpg',
                        name: 'Charlie',
                        type: 'Dog',
                        onTap: () {
                          Get.toNamed<void>(AppRoutes.petDetails);
                        },
                        petLost: true),
                    const Divider(thickness: .5),
                  ],
                );
              }),
              CustomButtonNew(
                onTap: () {
                  Get.toNamed<void>(AppRoutes.addPet);
                },
                text: 'Add Pet',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pet(
      {required String img,
      required String name,
      required String type,
      required Function() onTap,
      bool petLost = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h, top: 1.5.h),
      child: Row(children: [
        SizedBox(
          height: 6.5.h,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(img)),
        ),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    theme.titleLarge?.copyWith(color: AppColors.primaryText)),
            Text(type, style: theme.titleMedium)
          ],
        ),
        const Spacer(),
        if (petLost)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.redBg,
            ),
            child: Text(
              'Pet Lost',
              style: theme.titleMedium?.copyWith(color: AppColors.redText),
            ),
          ),
        SizedBox(width: 2.w),
        GestureDetector(
          onTap: onTap,
          child: Icon(CupertinoIcons.forward, color: AppColors.secondaryColor),
        )
      ]),
    );
  }
}
