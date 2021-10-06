// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) {
  return ProductListModel(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ProductModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
