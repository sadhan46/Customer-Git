import 'package:json_annotation/json_annotation.dart';

part 'ProfileModel.g.dart';

@JsonSerializable()
class BusinessModel {
  String username;
  String titleline;
  String address;
  String mobile_number;
  BusinessModel(
      {
        this.address,
        this.mobile_number,
        this.titleline,
        this.username});

  factory BusinessModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessModelFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessModelToJson(this);
}