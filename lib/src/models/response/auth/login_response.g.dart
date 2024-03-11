// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      userId: json['user_id'] as String,
      mobileNumber: json['mobile_number'] as String,
      countryCode: json['country_code'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'mobile_number': instance.mobileNumber,
      'country_code': instance.countryCode,
      'otp': instance.otp,
    };
