import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/auth_controller.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/api_endpoints.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/constants/keys.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector {
  DependencyInjector(this.pref) {
    _configLoading();
    Helpers.prefs = pref;
    _injectDio(pref);
    _injectControllers();
  }
  SharedPreferences pref;

  static void _configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorColor = AppColors.primaryColor
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..textColor = AppColors.primaryText
      ..indicatorSize = 40.0
      ..radius = 20.0
      ..userInteractions = true
      ..boxShadow = <BoxShadow>[]
      ..textStyle = TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Lato',
        fontSize: 20,
        color: AppColors.primaryText,
      );
  }

  static void _injectDio(SharedPreferences pref) {
    final token = pref.getString(Keys.token);
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        headers: token != null
            ? {'Authorization': 'Bearer $token', 'Accept': 'application/json'}
            : null,
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
    Helpers.dio = dio;
  }

  static void _injectControllers() {
    Get
      ..lazyPut(DashController.new, fenix: true)
      ..lazyPut(AuthController.new, fenix: true);
  }
}
