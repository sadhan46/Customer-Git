import 'package:customer1/Models/ProductModel.dart';
import 'package:customer1/Models/ServiceModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SlotsModel.g.dart';

@JsonSerializable()
class SlotsModel {
  String username;
  String slot_1_starting_time ;
  String slot_1_ending_time ;
  String slot_2_starting_time ;
  String slot_2_ending_time ;
  String slot_3_starting_time ;
  String slot_3_ending_time ;
  String slot_4_starting_time ;
  String slot_4_ending_time ;
  String slot_5_starting_time ;
  String slot_5_ending_time ;
  String slot_6_starting_time ;
  String slot_6_ending_time ;
  String date;
  List<String> close_days;



  SlotsModel(
      {
        this.username,
        this.slot_1_starting_time ,
        this.slot_1_ending_time ,
        this.slot_2_starting_time ,
        this.slot_2_ending_time ,
        this.slot_3_starting_time ,
        this.slot_3_ending_time ,
        this.slot_4_starting_time ,
        this.slot_4_ending_time ,
        this.slot_5_starting_time ,
        this.slot_5_ending_time ,
        this.slot_6_starting_time ,
        this.slot_6_ending_time ,
        this.date,
        this.close_days,
      });

  factory SlotsModel.fromJson(Map<String, dynamic> json) =>
      _$SlotsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SlotsModelToJson(this);
}