// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BusinessListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessListModel _$BusinessListModelFromJson(Map<String, dynamic> json) {
  return BusinessListModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : BusinessModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BusinessListModelToJson(BusinessListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
