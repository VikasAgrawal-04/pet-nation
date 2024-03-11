// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileResponseImpl _$$ProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileResponseImpl(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      countryCode: json['country_code'] as String,
      mobileNumber: json['mobile_number'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      houseNo: json['house_no'] as String,
      floorNo: json['floor_no'] as String,
      poBox: json['po_box'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      pincode: json['pincode'] as String,
      language: json['language'] as String,
      profileImage: json['profileImage'] as String,
      apiToken: json['api_token'] as String,
    );

Map<String, dynamic> _$$ProfileResponseImplToJson(
        _$ProfileResponseImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'country_code': instance.countryCode,
      'mobile_number': instance.mobileNumber,
      'dob': instance.dob,
      'gender': instance.gender,
      'house_no': instance.houseNo,
      'floor_no': instance.floorNo,
      'po_box': instance.poBox,
      'country': instance.country,
      'city': instance.city,
      'pincode': instance.pincode,
      'language': instance.language,
      'profileImage': instance.profileImage,
      'api_token': instance.apiToken,
    };
