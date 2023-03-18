import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/sheets_response_entity.dart';

SheetsResponseEntity $SheetsResponseEntityFromJson(Map<String, dynamic> json) {
  final SheetsResponseEntity sheetsResponseEntity = SheetsResponseEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    sheetsResponseEntity.success = success;
  }
  final List<SheetsResponseData>? data =
      jsonConvert.convertListNotNull<SheetsResponseData>(json['data']);
  if (data != null) {
    sheetsResponseEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    sheetsResponseEntity.message = message;
  }
  return sheetsResponseEntity;
}

Map<String, dynamic> $SheetsResponseEntityToJson(SheetsResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

SheetsResponseData $SheetsResponseDataFromJson(Map<String, dynamic> json) {
  final SheetsResponseData sheetsResponseData = SheetsResponseData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    sheetsResponseData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    sheetsResponseData.name = name;
  }
  final String? endTime = jsonConvert.convert<String>(json['end_time']);
  if (endTime != null) {
    sheetsResponseData.endTime = endTime;
  }
  final String? refreshedAt = jsonConvert.convert<String>(json['refreshed_at']);
  if (endTime != null) {
    sheetsResponseData.refreshedAt = refreshedAt;
  }
  final String? declared_result =
      jsonConvert.convert<String>(json['declared_result']);
  if (declared_result != null) {
    sheetsResponseData.declared_result = declared_result;
  }
  final int? declared_status =
      jsonConvert.convert<int>(json['declared_status']);
  if (declared_status != null) {
    sheetsResponseData.declared_status = declared_status;
  }
  return sheetsResponseData;
}

Map<String, dynamic> $SheetsResponseDataToJson(SheetsResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['end_time'] = entity.endTime;
  data['refreshed_at'] = entity.refreshedAt;
  data['declared_result'] = entity.declared_result;
  data['declared_status'] = entity.declared_status;
  return data;
}
