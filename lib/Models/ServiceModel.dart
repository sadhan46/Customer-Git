import 'package:json_annotation/json_annotation.dart';

part 'ServiceModel.g.dart';

@JsonSerializable()
class ServiceModel {
  @JsonKey(name: "_id")
  String id;
  String username;
  String serviceName;
  String currency;
  String serviceCost;
  String hr;
  String min;
  int counter;
  bool addProduct;

  ServiceModel(
      {
        this.id,
        this.username,
        this.serviceName,
        this.currency,
        this.serviceCost,
        this.hr,
        this.min,
        this.counter,
        this.addProduct,
      });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}