// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return _ProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileResponse {
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_no')
  String get houseNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor_no')
  String get floorNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'po_box')
  String get poBox => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_token')
  String get apiToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileResponseCopyWith<ProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileResponseCopyWith<$Res> {
  factory $ProfileResponseCopyWith(
          ProfileResponse value, $Res Function(ProfileResponse) then) =
      _$ProfileResponseCopyWithImpl<$Res, ProfileResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      String dob,
      String gender,
      @JsonKey(name: 'house_no') String houseNo,
      @JsonKey(name: 'floor_no') String floorNo,
      @JsonKey(name: 'po_box') String poBox,
      String country,
      String city,
      String pincode,
      String language,
      String profileImage,
      @JsonKey(name: 'api_token') String apiToken});
}

/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res, $Val extends ProfileResponse>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? dob = null,
    Object? gender = null,
    Object? houseNo = null,
    Object? floorNo = null,
    Object? poBox = null,
    Object? country = null,
    Object? city = null,
    Object? pincode = null,
    Object? language = null,
    Object? profileImage = null,
    Object? apiToken = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      houseNo: null == houseNo
          ? _value.houseNo
          : houseNo // ignore: cast_nullable_to_non_nullable
              as String,
      floorNo: null == floorNo
          ? _value.floorNo
          : floorNo // ignore: cast_nullable_to_non_nullable
              as String,
      poBox: null == poBox
          ? _value.poBox
          : poBox // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileResponseImplCopyWith<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  factory _$$ProfileResponseImplCopyWith(_$ProfileResponseImpl value,
          $Res Function(_$ProfileResponseImpl) then) =
      __$$ProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      String dob,
      String gender,
      @JsonKey(name: 'house_no') String houseNo,
      @JsonKey(name: 'floor_no') String floorNo,
      @JsonKey(name: 'po_box') String poBox,
      String country,
      String city,
      String pincode,
      String language,
      String profileImage,
      @JsonKey(name: 'api_token') String apiToken});
}

/// @nodoc
class __$$ProfileResponseImplCopyWithImpl<$Res>
    extends _$ProfileResponseCopyWithImpl<$Res, _$ProfileResponseImpl>
    implements _$$ProfileResponseImplCopyWith<$Res> {
  __$$ProfileResponseImplCopyWithImpl(
      _$ProfileResponseImpl _value, $Res Function(_$ProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? dob = null,
    Object? gender = null,
    Object? houseNo = null,
    Object? floorNo = null,
    Object? poBox = null,
    Object? country = null,
    Object? city = null,
    Object? pincode = null,
    Object? language = null,
    Object? profileImage = null,
    Object? apiToken = null,
  }) {
    return _then(_$ProfileResponseImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      houseNo: null == houseNo
          ? _value.houseNo
          : houseNo // ignore: cast_nullable_to_non_nullable
              as String,
      floorNo: null == floorNo
          ? _value.floorNo
          : floorNo // ignore: cast_nullable_to_non_nullable
              as String,
      poBox: null == poBox
          ? _value.poBox
          : poBox // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      apiToken: null == apiToken
          ? _value.apiToken
          : apiToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileResponseImpl implements _ProfileResponse {
  const _$ProfileResponseImpl(
      {@JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      @JsonKey(name: 'country_code') required this.countryCode,
      @JsonKey(name: 'mobile_number') required this.mobileNumber,
      required this.dob,
      required this.gender,
      @JsonKey(name: 'house_no') required this.houseNo,
      @JsonKey(name: 'floor_no') required this.floorNo,
      @JsonKey(name: 'po_box') required this.poBox,
      required this.country,
      required this.city,
      required this.pincode,
      required this.language,
      required this.profileImage,
      @JsonKey(name: 'api_token') required this.apiToken});

  factory _$ProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileResponseImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  @JsonKey(name: 'country_code')
  final String countryCode;
  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  final String dob;
  @override
  final String gender;
  @override
  @JsonKey(name: 'house_no')
  final String houseNo;
  @override
  @JsonKey(name: 'floor_no')
  final String floorNo;
  @override
  @JsonKey(name: 'po_box')
  final String poBox;
  @override
  final String country;
  @override
  final String city;
  @override
  final String pincode;
  @override
  final String language;
  @override
  final String profileImage;
  @override
  @JsonKey(name: 'api_token')
  final String apiToken;

  @override
  String toString() {
    return 'ProfileResponse(firstName: $firstName, lastName: $lastName, email: $email, countryCode: $countryCode, mobileNumber: $mobileNumber, dob: $dob, gender: $gender, houseNo: $houseNo, floorNo: $floorNo, poBox: $poBox, country: $country, city: $city, pincode: $pincode, language: $language, profileImage: $profileImage, apiToken: $apiToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileResponseImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.houseNo, houseNo) || other.houseNo == houseNo) &&
            (identical(other.floorNo, floorNo) || other.floorNo == floorNo) &&
            (identical(other.poBox, poBox) || other.poBox == poBox) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.apiToken, apiToken) ||
                other.apiToken == apiToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      countryCode,
      mobileNumber,
      dob,
      gender,
      houseNo,
      floorNo,
      poBox,
      country,
      city,
      pincode,
      language,
      profileImage,
      apiToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileResponseImplCopyWith<_$ProfileResponseImpl> get copyWith =>
      __$$ProfileResponseImplCopyWithImpl<_$ProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfileResponse implements ProfileResponse {
  const factory _ProfileResponse(
          {@JsonKey(name: 'first_name') required final String firstName,
          @JsonKey(name: 'last_name') required final String lastName,
          required final String email,
          @JsonKey(name: 'country_code') required final String countryCode,
          @JsonKey(name: 'mobile_number') required final String mobileNumber,
          required final String dob,
          required final String gender,
          @JsonKey(name: 'house_no') required final String houseNo,
          @JsonKey(name: 'floor_no') required final String floorNo,
          @JsonKey(name: 'po_box') required final String poBox,
          required final String country,
          required final String city,
          required final String pincode,
          required final String language,
          required final String profileImage,
          @JsonKey(name: 'api_token') required final String apiToken}) =
      _$ProfileResponseImpl;

  factory _ProfileResponse.fromJson(Map<String, dynamic> json) =
      _$ProfileResponseImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;
  @override
  @JsonKey(name: 'country_code')
  String get countryCode;
  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @override
  String get dob;
  @override
  String get gender;
  @override
  @JsonKey(name: 'house_no')
  String get houseNo;
  @override
  @JsonKey(name: 'floor_no')
  String get floorNo;
  @override
  @JsonKey(name: 'po_box')
  String get poBox;
  @override
  String get country;
  @override
  String get city;
  @override
  String get pincode;
  @override
  String get language;
  @override
  String get profileImage;
  @override
  @JsonKey(name: 'api_token')
  String get apiToken;
  @override
  @JsonKey(ignore: true)
  _$$ProfileResponseImplCopyWith<_$ProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
