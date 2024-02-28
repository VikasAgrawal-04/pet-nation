import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/controllers/dash_controller.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class DependencyInjector {
  SharedPreferences pref;
  DependencyInjector(this.pref) {
    _injectPref(pref);
    _injectDio();
    _injectControllers();
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
