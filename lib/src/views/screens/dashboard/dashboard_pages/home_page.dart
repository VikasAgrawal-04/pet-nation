import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_nations/src/views/widgets/textfield/search_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(100.w, 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: AppBar(
              leading: Image.asset(
                'assets/images/dog_splash.png',
                fit: BoxFit.scaleDown,
                scale: 1.5,
              ),
              title: SearchField(
                controller: searchControl,
                onEditingComplete: () async {},
              ),
              actions: [
                GestureDetector(
                  child:
                      SvgPicture.asset('assets/icons/bell.svg', height: 3.2.h),
                )
              ],
            ),
          )),
    );
  }
}
