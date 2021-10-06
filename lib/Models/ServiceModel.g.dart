// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return ServiceModel(
    id: json['_id'] as String,
    username: json['username'] as String,
    serviceName: json['serviceName'] as String,
    currency: json['currency'] as String,
    serviceCost: json['serviceCost'] as String,
    hr: json['hr'] as String,
    min: json['min'] as String,
    counter: json['counter'] as int,
    addProduct: json['addProduct'] as bool,
  );
}

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'serviceName': instance.serviceName,
      'currency': instance.currency,
      'serviceCost': instance.serviceCost,
      'hr': instance.hr,
      'min': instance.min,
      'counter': instance.counter,
      'addProduct': instance.addProduct,
    };
