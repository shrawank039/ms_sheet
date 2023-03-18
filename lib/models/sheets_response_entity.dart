import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/sheets_response_entity.g.dart';

@JsonSerializable()
class SheetsResponseEntity {
  bool? success;
  List<SheetsResponseData>? data;
  String? message;

  SheetsResponseEntity();

  factory SheetsResponseEntity.fromJson(Map<String, dynamic> json) =>
      $SheetsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $SheetsResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SheetsResponseData {
  int? id;
  String? name;
  @JSONField(name: "end_time")
  String? endTime;
  String? refreshedAt;
  String? declared_result;
  int? declared_status;

  SheetsResponseData();

  factory SheetsResponseData.fromJson(Map<String, dynamic> json) =>
      $SheetsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $SheetsResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
