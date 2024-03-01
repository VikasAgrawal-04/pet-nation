import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar backAppBar(String title) {
  final theme = Get.textTheme;
  return AppBar(
    elevation: 1,
    backgroundColor: Colors.white,
    titleSpacing: 0,
    leading: GestureDetector(
      onTap: () {
        Get.back<void>();
      },
      child: const Icon(CupertinoIcons.back),
    ),
    title: Text(
      title,
      style: theme.displaySmall,
    ),
  );
}
