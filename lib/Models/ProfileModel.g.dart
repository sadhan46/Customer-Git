// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessModel _$BusinessModelFromJson(Map<String, dynamic> json) {
  return BusinessModel(
    address: json['address'] as String,
    mobile_number: json['mobile_number'] as String,
    titleline: json['titleline'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$BusinessModelToJson(BusinessModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'titleline': instance.titleline,
      'address': instance.address,
      'mobile_number': instance.mobile_number,
    };
