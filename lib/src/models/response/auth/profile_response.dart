import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';


@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    @JsonKey(name: 'country_code') required String countryCode,
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    required String dob,
    required String gender,
    @JsonKey(name: 'house_no') required String houseNo,
    @JsonKey(name: 'floor_no') required String floorNo,
    @JsonKey(name: 'po_box') required String poBox,
    required String country,
    required String city,
    required String pincode,
    required String language,
    required String profileImage,
    @JsonKey(name: 'api_token') required String apiToken,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
