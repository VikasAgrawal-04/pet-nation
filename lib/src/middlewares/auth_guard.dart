import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/keys.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final userData = Helpers.getString(key: Keys.token);
    if (userData == null) {
      return const RouteSettings(name: AppRoutes.splash);
    } else {
      return super.redirect(route);
    }
  }
}
