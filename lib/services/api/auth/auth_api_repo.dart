import 'package:pet_nations/services/api/api_result.dart';
import 'package:pet_nations/src/models/response/auth/login_response.dart';
import 'package:pet_nations/src/models/response/auth/profile_response.dart';

abstract class AuthApiRepo {
  Future<ApiResult<LoginResponse>> login({
    required String countryCode,
    required String mobile,
  });

  Future<ApiResult<ProfileResponse>> verifyOtp({required String otp});
  Future<ApiResult<ProfileResponse>> getProfile();
  Future<ApiResult<ProfileResponse>> updateProfile(ProfileResponse data);
}
