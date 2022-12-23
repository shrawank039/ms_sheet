import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/panel_response_entity.g.dart';

@JsonSerializable()
class PanelResponseEntity {
  bool? success;
  List<PanelResponseData>? data;
  String? message;

  PanelResponseEntity();

  factory PanelResponseEntity.fromJson(Map<String, dynamic> json) =>
      $PanelResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $PanelResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PanelResponseData {
  int? id;
  @JSONField(name: "sheet_id")
  int? sheetId;
  @JSONField(name: "agent_id")
  int? agentId;
  String? pair;
  String? date;
  String? name;

  PanelResponseData();

  factory PanelResponseData.fromJson(Map<String, dynamic> json) =>
      $PanelResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $PanelResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
