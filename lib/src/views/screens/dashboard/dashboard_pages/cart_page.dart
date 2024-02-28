import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final dashControl = Get.find<DashController>();

  @override
  Widget build(BuildContext context) {
    final theme = Get.textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {
            dashControl.curIndex.value = 0;
          },
          child: const Icon(CupertinoIcons.back),
        ),
        title: Text(
          'Shopping Cart',
          style: theme.displaySmall,
        ),
      ),
    );
  }
}
