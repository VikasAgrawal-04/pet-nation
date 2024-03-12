import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/api/api_repo.dart';
import 'package:pet_nations/services/api/api_repo_impl.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/keys.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:pet_nations/src/models/response/auth/profile_response.dart';

class AuthController extends GetxController {
  final ApiRepo _repo = ApiRepoImpl();

  Future<void> login(String mobile) async {
    final res = await _repo.login(countryCode: '+91', mobile: mobile);
    res.when(
      success: (success) {
        Helpers.setString(key: Keys.userId, value: success.userId);
        Get.toNamed<void>(AppRoutes.otp);
      },
      failure: (failure) {
        EasyLoading.showError(failure.message.toString());
      },
    );
  }

  Future<void> otp(String otp) async {
    final res = await _repo.verifyOtp(otp: otp);
    res.when(
      success: (success) {
        Helpers.setString(key: Keys.token, value: success.apiToken);
        Helpers.setToken(success.apiToken);
        Get.toNamed<void>(AppRoutes.dashboard);
      },
      failure: (failure) {
        EasyLoading.showError(failure.message.toString());
      },
    );
  }

  Future<ProfileResponse?> fetchProfile() async {
    final res = await _repo.getProfile();
    ProfileResponse? data;
    res.when(
      success: (success) {
        data = success;
      },
      failure: (failure) {
        data = null;
      },
    );
    return data;
  }
}
