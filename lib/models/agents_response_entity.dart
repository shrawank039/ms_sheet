import 'dart:convert';

import 'package:ms_sheet/generated/json/agents_response_entity.g.dart';
import 'package:ms_sheet/generated/json/base/json_field.dart';

@JsonSerializable()
class AgentsResponseEntity {
  bool? success;
  List<AgentsResponseData>? data;
  String? message;

  AgentsResponseEntity();

  factory AgentsResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AgentsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AgentsResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AgentsResponseData {
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
  @JSONField(name: "bid_limit")
  String? bidLimit;
  @JSONField(name: "daily_incentive")
  String? dailyIncentive;
  String? preference;
  @JSONField(name: "created_at")
  String? createdAt;

  AgentsResponseData();

  factory AgentsResponseData.fromJson(Map<String, dynamic> json) =>
      $AgentsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AgentsResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
