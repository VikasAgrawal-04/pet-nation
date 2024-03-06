import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/tab/custom_tabar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Notification', centerTitle: true, actions: [
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))
      ]),
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTabar(['All', 'Orders', 'Payment', 'Others']),
              SizedBox(height: 2.h),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 100.h,
                  child: const TabBarView(children: [NotificationTabbarView()]))
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTabbarView extends StatelessWidget {
  const NotificationTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _card(
          img:
              'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/rockcms/2022-08/220805-border-collie-play-mn-1100-82d2f1.jpg',
          title: 'Pet Lost/Found',
          date: '22 Feb 2024',
          onTap: () {},
        );
      },
      itemCount: 15,
    );
  }

  Widget _card({
    required String img,
    required String title,
    required String date,
    required Function() onTap,
  }) {
    final theme = Get.textTheme;
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(children: [
              SizedBox(
                height: 6.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(img)),
              ),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: theme.titleLarge
                          ?.copyWith(color: AppColors.primaryText)),
                  Text(date, style: theme.titleMedium)
                ],
              ),
            ]),
            const Divider(thickness: .5)
          ],
        ),
      ),
    );
  }
}
