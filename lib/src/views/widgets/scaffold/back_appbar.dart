import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar backAppBar(String title, {bool? centerTitle, List<Widget>? actions}) {
  final theme = Get.textTheme;
  return AppBar(
    centerTitle: centerTitle,
    elevation: 1,
    backgroundColor: Colors.white,
    titleSpacing: 0,
    actions: actions,
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
