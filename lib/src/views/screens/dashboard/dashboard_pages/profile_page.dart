import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dashControl = Get.find<DashController>();

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
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
            'Account Profile',
            style: theme.displaySmall,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/cart.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/exit.svg'))
          ],
        ),
      ),
    );
  }
}
