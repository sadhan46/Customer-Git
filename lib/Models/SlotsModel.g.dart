// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SlotsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotsModel _$SlotsModelFromJson(Map<String, dynamic> json) {
  return SlotsModel(
    username: json['username'] as String,
    slot_1_starting_time: json['slot_1_starting_time'] as String,
    slot_1_ending_time: json['slot_1_ending_time'] as String,
    slot_2_starting_time: json['slot_2_starting_time'] as String,
    slot_2_ending_time: json['slot_2_ending_time'] as String,
    slot_3_starting_time: json['slot_3_starting_time'] as String,
    slot_3_ending_time: json['slot_3_ending_time'] as String,
    slot_4_starting_time: json['slot_4_starting_time'] as String,
    slot_4_ending_time: json['slot_4_ending_time'] as String,
    slot_5_starting_time: json['slot_5_starting_time'] as String,
    slot_5_ending_time: json['slot_5_ending_time'] as String,
    slot_6_starting_time: json['slot_6_starting_time'] as String,
    slot_6_ending_time: json['slot_6_ending_time'] as String,
    date: json['date'] as String,
    close_days: (json['close_days'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SlotsModelToJson(SlotsModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'slot_1_starting_time': instance.slot_1_starting_time,
      'slot_1_ending_time': instance.slot_1_ending_time,
      'slot_2_starting_time': instance.slot_2_starting_time,
      'slot_2_ending_time': instance.slot_2_ending_time,
      'slot_3_starting_time': instance.slot_3_starting_time,
      'slot_3_ending_time': instance.slot_3_ending_time,
      'slot_4_starting_time': instance.slot_4_starting_time,
      'slot_4_ending_time': instance.slot_4_ending_time,
      'slot_5_starting_time': instance.slot_5_starting_time,
      'slot_5_ending_time': instance.slot_5_ending_time,
      'slot_6_starting_time': instance.slot_6_starting_time,
      'slot_6_ending_time': instance.slot_6_ending_time,
      'date': instance.date,
      'close_days': instance.close_days,
    };
