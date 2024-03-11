import 'package:pet_nations/src/core/utils/environment/environment.dart';

class EndPoints {
  static final baseUrl = Environment.baseUrl;

  //Auth
  static const String login = '/register';
  static const String verifyOtp = 'verify_otp';
  static const String getProfile = '/get-profile';
}
