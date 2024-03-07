import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_nations/src/views/screens/menu_screens/track_order_views/track_order_view.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/tab/custom_tabar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('My Orders', centerTitle: true, actions: [
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))
      ]),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
            headerSliverBuilder: (((context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child:
                      customTabar(['All', 'Ongoing', 'Completed', 'Cancelled']),
                )
              ];
            })),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: const TabBarView(children: [
                TrackOrderView(),
                TrackOrderView(),
                TrackOrderView(),
                TrackOrderView()
              ]),
            )),
      ),
    );
  }
}
