import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/constant.dart';
import 'package:pet_nations/src/views/widgets/scaffold/bottom_nav.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dashControl = Get.find<DashController>();
  final _bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(onTap: (index) {
        dashControl.curIndex.value = index;
      }),
      body: SafeArea(child: Obx(() {
        return PageStorage(
            bucket: _bucket, child: Constant.pages[dashControl.curIndex.value]);
      })),
    );
  }
}
