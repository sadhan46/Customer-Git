import 'package:customer1/Models/ServiceModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Services.g.dart';

@JsonSerializable()
class Services {
  List<ServiceModel> data;
  Services({this.data});
  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}