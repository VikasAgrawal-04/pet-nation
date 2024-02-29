import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class DependencyInjector {
  SharedPreferences pref;
  DependencyInjector(this.pref) {
    _configLoading();
    _injectPref(pref);
    _injectDio();
    _injectControllers();
  }

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
          color: AppColors.primaryText);
  }

  static void _injectPref(pref) {
    Helpers.prefs = pref;
  }

  static void _injectDio() {
    final dio = Dio();
    dio.interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(printRequestHeaders: true)));
    Helpers.dio = dio;
  }

  static void _injectControllers() {
    Get.lazyPut(() => DashController(), fenix: true);
  }
}
