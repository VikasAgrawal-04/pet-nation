import 'package:dio/dio.dart';
import 'package:pet_nations/services/api/api_result.dart';
import 'package:pet_nations/services/api/auth/auth_api_repo.dart';
import 'package:pet_nations/src/core/errors/exception.dart';
import 'package:pet_nations/src/core/utils/constants/api_endpoints.dart';
import 'package:pet_nations/src/core/utils/constants/keys.dart';
import 'package:pet_nations/src/core/utils/helpers/helpers.dart';
import 'package:pet_nations/src/models/response/auth/login_response.dart';
import 'package:pet_nations/src/models/response/auth/profile_response.dart';

class AuthApiRepoImpl implements AuthApiRepo {
  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final userId = Helpers.getString(key: Keys.userId);
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.getProfile,
        formData: FormData.fromMap({'user_id': userId}),
      );
      return ApiResult.success(
          data: ProfileResponse.fromJson(
        response?['data'] as Map<String, dynamic>,
      ));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<LoginResponse>> login({
    required String countryCode,
    required String mobile,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.login,
        formData: FormData.fromMap({
          'country_code': countryCode,
          'mobile_number': mobile,
        }),
      );
      return ApiResult.success(
        data: LoginResponse.fromJson(
          response?['data'] as Map<String, dynamic>,
        ),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> verifyOtp({required String otp}) async {
    try {
      final userId = Helpers.getString(key: Keys.userId);
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.verifyOtp,
        formData: FormData.fromMap({'user_id': userId, 'otp': otp}),
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(
          response?['data'] as Map<String, dynamic>,
        ),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
}
