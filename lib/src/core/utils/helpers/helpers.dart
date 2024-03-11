import 'dart:convert';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pet_nations/src/core/errors/exception.dart';
import 'package:pet_nations/src/core/errors/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum RequestType { get, post, put, delete }

enum LoggerType { d, e, i, f, t, w }

class Helpers {
  static late SharedPreferences? _prefs;
  static late Dio? _dio;

  static set prefs(SharedPreferences pref) => _prefs = pref;

  static SharedPreferences get prefs => _prefs!;

  static set dio(Dio dio) => _dio = dio;

  static Dio get dio => _dio!;

  static void logger({
    required LoggerType type,
    required String message,
    StackTrace? stack,
  }) {
    final logger = Logger(printer: PrettyPrinter());

    switch (type) {
      case LoggerType.d:
        logger.d(message, stackTrace: stack);
      case LoggerType.e:
        logger.e(message, stackTrace: stack);
      case LoggerType.i:
        logger.i(message, stackTrace: stack);
      case LoggerType.f:
        logger.f(message, stackTrace: stack);
      case LoggerType.t:
        logger.t(message, stackTrace: stack);
      case LoggerType.w:
        logger.w(message, stackTrace: stack);
    }
  }

  static void setToken(String token) {
    _dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
  }

  static Future<Map<String, dynamic>?> sendRequest(
    RequestType type,
    String path, {
    Map<String, dynamic>? queryParams,
    bool encoded = false,
    dynamic data,
    dynamic listData,
    FormData? formData,
  }) async {
    try {
      Response<dynamic> response;

      switch (type) {
        case RequestType.get:
          response = await _dio!.get(path, queryParameters: queryParams);
        case RequestType.post:
          response = await _dio!.post(
            path,
            options: Options(
              contentType:
                  encoded == true ? Headers.formUrlEncodedContentType : null,
              validateStatus: (code) => true,
            ),
            data: queryParams ?? listData ?? formData,
          );
        case RequestType.put:
          response =
              await _dio!.put(path, data: data, queryParameters: queryParams);
        case RequestType.delete:
          response = await _dio!.delete(path, queryParameters: queryParams);
      }

      if ((response.data as Map<String, dynamic>)['code'] == '200' ||
          (response.data as Map<String, dynamic>)['code'] == '202') {
        return response.data as Map<String, dynamic>;
      } else if ((response.data as Map<String, dynamic>)['code'] == '400' ||
          (response.data as Map<String, dynamic>)['code'] == '401' ||
          (response.data as Map<String, dynamic>)['code'] == '402') {
        throw ServerException(
          code: response.statusCode,
          message:
              (response.data as Map<String, dynamic>)['message'].toString(),
        );
      } else {
        throw ServerException(
          code: response.statusCode,
          message:
              (response.data as Map<String, dynamic>)['message'].toString(),
        );
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message, code: e.code);
    } on DioException catch (e) {
      debugPrint('Dio Exception ${e.response?.data} ${e.type} ${e.message}');
      if (e.error == 'Http status error [401]') {
        debugPrint("I go here 3 ${e.error == "Http status error [401]"}");
      } else {
        throw ServerException(
          code: int.tryParse(
            (e.response?.data as Map<String, dynamic>)['code'].toString(),
          ),
          message: e.error is io.SocketException
              ? 'No Internet'
              : (e.response?.data as Map<String, dynamic>)['message']
                  .toString(),
        );
      }
    }
    return null;
  }

  static String convertFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    return 'Unknown error occured';
  }

  static void setString({required String key, required String value}) {
    prefs.setString(key, value);
  }

  static void deleteString({required String key}) {
    prefs.remove(key);
  }

  static String? getString({required String key}) {
    return prefs.getString(key);
  }

  static Future<void> clearShared() async {
    await prefs.clear();
  }

  static String dateFormat(String dateTime) {
    return DateFormat('d MMM yyyy').format(DateTime.parse(dateTime));
  }

  static String timeFormat(String dateTime) {
    return DateFormat('hh:mm a').format(DateTime.parse(dateTime));
  }

  static String displayDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String jsonDate(String date) {
    final rawDate = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(rawDate);
  }

  static String apiToApiDate(String date) {
    final originalDate = DateFormat('dd-MM-yyyy').parse(date);
    final formattedDateStr = DateFormat('yyyy-MM-dd').format(originalDate);
    return formattedDateStr;
  }

  static String displayTime(DateTime date) {
    return DateFormat('dd/MM/yyyy h:mm a').format(date);
  }

  static List<String> generateTime({required bool todayDate}) {
    final timeRange = <String>[];
    const startTime = 10;
    const endTime = 18;
    final currentTime = const TimeOfDay(hour: 4, minute: 00).hour;

    if (todayDate) {
      if (currentTime < endTime) {
        for (var i = startTime; i <= endTime; i++) {
          if (i > currentTime) {
            timeRange.add('$i:00');
          }
        }
      }
    } else {
      for (var i = startTime; i <= endTime; i++) {
        timeRange.add('$i:00');
      }
    }
    return timeRange;
  }

  static Image imgFromBase64(String base64) {
    return Image.memory(
      base64Decode(base64),
      fit: BoxFit.scaleDown,
      scale: 12,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut,
          child: GestureDetector(
            onTap: () {
              showDialog<dynamic>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: Image.memory(base64Decode(base64)),
                  );
                },
              );
            },
            child: child,
          ),
        );
      },
    );
  }
}

class NumberInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains('.')) {
      return oldValue;
    } else if (newValue.text.contains(RegExp(r'[^\d]'))) {
      return oldValue;
    }
    return newValue;
  }
}
