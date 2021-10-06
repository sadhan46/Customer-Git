import 'package:json_annotation/json_annotation.dart';

part 'ProductModel.g.dart';

@JsonSerializable()
class ProductModel {
  String username;
  String product_name;
  String product_details;
  List<String> productImage;
  String quantity;
  String currency;
  String unit;
  @JsonKey(name: "_id")
  String id;
  String mrp;
  String sp;
  String per;
  int counter;
  bool addProduct;

  ProductModel(
      {
        this.username,
        this.product_name,
        this.product_details,
        this.productImage,
        this.currency,
        this.quantity,
        this.unit,
        this.id,
        this.mrp,
        this.sp,
        this.per,
        this.counter,
        this.addProduct,

      });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}