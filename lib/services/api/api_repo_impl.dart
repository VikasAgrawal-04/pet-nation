import 'package:pet_nations/services/api/api_repo.dart';
import 'package:pet_nations/services/api/api_result.dart';
import 'package:pet_nations/services/api/auth/auth_api_repo.dart';
import 'package:pet_nations/services/api/auth/auth_api_repo_impl.dart';
import 'package:pet_nations/src/models/response/auth/login_response.dart';
import 'package:pet_nations/src/models/response/auth/profile_response.dart';

class ApiRepoImpl implements ApiRepo {
  ApiRepoImpl() : _authRepo = AuthApiRepoImpl();
  final AuthApiRepo _authRepo;
  @override
  Future<ApiResult<ProfileResponse>> getProfile() {
    return _authRepo.getProfile();
  }

  @override
  Future<ApiResult<LoginResponse>> login({
    required String countryCode,
    required String mobile,
  }) {
    return _authRepo.login(countryCode: countryCode, mobile: mobile);
  }

  @override
  Future<ApiResult<ProfileResponse>> verifyOtp({required String otp}) {
    return _authRepo.verifyOtp(otp: otp);
  }
}
