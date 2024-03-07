import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/views/screens/menu_screens/product_list_views/all_list_views.dart';
import 'package:pet_nations/src/views/screens/menu_screens/product_list_views/other_product_list_view.dart';
import 'package:pet_nations/src/views/widgets/fields/search_textfield.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/tab/custom_tabar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final theme = Get.textTheme;
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Shop By Products'),
      body: DefaultTabController(
        length: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(children: [
                      SearchField(controller: search, style: theme.titleLarge),
                      customTabar(['All', 'Cats', 'Dogs', 'Fish']),
                    ]),
                  )
                ];
              }),
              body: const TabBarView(children: [
                AllListView(),
                OtherProductListView(title: 'Cats'),
                OtherProductListView(title: 'Dogs'),
                OtherProductListView(title: 'Fishes')
              ])),
        ),
      ),
    );
  }
}
