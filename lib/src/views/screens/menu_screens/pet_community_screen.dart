import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_nations/src/views/screens/menu_screens/pet_community_views/pet_community_view.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/tab/custom_tabar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetCommunityScreen extends StatefulWidget {
  const PetCommunityScreen({super.key});

  @override
  State<PetCommunityScreen> createState() => _PetCommunityScreenState();
}

class _PetCommunityScreenState extends State<PetCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(
        'Pet Community',
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/bell.svg', height: 3.2.h),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 7,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: customTabar(
                  [
                    'Pet Training',
                    'Pet Grooming',
                    'Pet Hotels',
                    'Dog Day Care',
                    'Bird',
                    'Reptile',
                    'Small Pet',
                  ],
                  scroll: true,
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: const TabBarView(
              children: [
                PetCommunityView(),
                PetCommunityView(),
                PetCommunityView(),
                PetCommunityView(),
                PetCommunityView(),
                PetCommunityView(),
                PetCommunityView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
