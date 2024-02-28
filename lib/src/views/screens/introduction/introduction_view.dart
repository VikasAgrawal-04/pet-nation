import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/views/screens/introduction/intro_screens/intro_screen1.dart';
import 'package:pet_nations/src/views/screens/introduction/intro_screens/intro_screen2.dart';
import 'package:pet_nations/src/views/screens/introduction/intro_screens/intro_screen3.dart';
import 'package:pet_nations/src/views/widgets/indicator/dot_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({super.key});

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  final _selectedPage = 0.obs;
  final _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(() {
        if (_pageController.page != null) {
          _selectedPage.value = _pageController.page!.toInt();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.5.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.login),
                  child: Text('Skip', style: Get.textTheme.titleMedium)),
            ),
            Expanded(
              child: PageStorage(
                  bucket: _bucket,
                  child: PageView(
                    controller: _pageController,
                    children: const <Widget>[
                      IntroScreenFirst(),
                      IntroScreenSecond(),
                      IntroScreenThird()
                    ],
                  )),
            ),
            DotIndicator(curIndex: _selectedPage)
          ],
        ),
      ),
    );
  }
}
