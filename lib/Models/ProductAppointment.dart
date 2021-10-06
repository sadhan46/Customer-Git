import 'package:customer1/Models/ProductModel.dart';
import 'package:customer1/Models/ServiceModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProductAppointment.g.dart';

@JsonSerializable()
class ProductAppointment {
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
  String customer_name;
  String customer_address;
  String customer_contact_number;
  String pin_Code;
  String start_time;
  String end_time;
  String total;
  List<String> close_days;
  List<ProductModel> cart_products;



  ProductAppointment(
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
        this.end_time,
        this.start_time,
        this.total,
        this.close_days,
        this.cart_products,
        this.customer_name,
        this.customer_address,
        this.customer_contact_number,
        this.pin_Code
      });

  factory ProductAppointment.fromJson(Map<String, dynamic> json) =>
      _$ProductAppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$ProductAppointmentToJson(this);
}