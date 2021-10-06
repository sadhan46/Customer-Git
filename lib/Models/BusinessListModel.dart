import 'package:customer1/Models/ProfileModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BusinessListModel.g.dart';

@JsonSerializable()
class BusinessListModel {
  List<BusinessModel> data;
  BusinessListModel({this.data});
  factory BusinessListModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessListModelFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessListModelToJson(this);
}