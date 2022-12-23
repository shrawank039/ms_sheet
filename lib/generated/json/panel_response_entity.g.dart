import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/panel_response_entity.dart';

PanelResponseEntity $PanelResponseEntityFromJson(Map<String, dynamic> json) {
  final PanelResponseEntity panelResponseEntity = PanelResponseEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    panelResponseEntity.success = success;
  }
  final List<PanelResponseData>? data =
      jsonConvert.convertListNotNull<PanelResponseData>(json['data']);
  if (data != null) {
    panelResponseEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    panelResponseEntity.message = message;
  }
  return panelResponseEntity;
}

Map<String, dynamic> $PanelResponseEntityToJson(PanelResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

PanelResponseData $PanelResponseDataFromJson(Map<String, dynamic> json) {
  final PanelResponseData panelResponseData = PanelResponseData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    panelResponseData.id = id;
  }
  final int? sheetId = jsonConvert.convert<int>(json['sheet_id']);
  if (sheetId != null) {
    panelResponseData.sheetId = sheetId;
  }
  final int? agentId = jsonConvert.convert<int>(json['agent_id']);
  if (agentId != null) {
    panelResponseData.agentId = agentId;
  }
  final String? pair = jsonConvert.convert<String>(json['pair']);
  if (pair != null) {
    panelResponseData.pair = pair;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    panelResponseData.date = date;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    panelResponseData.name = name;
  }
  return panelResponseData;
}

Map<String, dynamic> $PanelResponseDataToJson(PanelResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['sheet_id'] = entity.sheetId;
  data['agent_id'] = entity.agentId;
  data['pair'] = entity.pair;
  data['date'] = entity.date;
  data['name'] = entity.name;
  return data;
}
