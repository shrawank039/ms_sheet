import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/counters_entity.g.dart';

@JsonSerializable()
class CountersEntity {
  bool? success;
  List<CountersData>? data;
  String? message;

  CountersEntity();

  factory CountersEntity.fromJson(Map<String, dynamic> json) =>
      $CountersEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountersEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountersData {
  int? id;
  String? name;
  @JSONField(name: "mobile_number")
  String? mobileNumber;
  @JSONField(name: "pair_rate")
  String? pairRate;
  @JSONField(name: "in_out_rate")
  String? inOutRate;
  String? commission;
  String? patti;
  @JSONField(name: "created_at")
  String? createdAt;

  CountersData();

  factory CountersData.fromJson(Map<String, dynamic> json) =>
      $CountersDataFromJson(json);

  Map<String, dynamic> toJson() => $CountersDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
