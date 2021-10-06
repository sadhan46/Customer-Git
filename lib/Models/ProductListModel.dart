import 'package:customer1/Models/ProductModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProductListModel.g.dart';

@JsonSerializable()
class ProductListModel {
  List<ProductModel> data;
  ProductListModel({this.data});
  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}