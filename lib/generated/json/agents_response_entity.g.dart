import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/agents_response_entity.dart';

AgentsResponseEntity $AgentsResponseEntityFromJson(Map<String, dynamic> json) {
  final AgentsResponseEntity agentsResponseEntity = AgentsResponseEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    agentsResponseEntity.success = success;
  }
  final List<AgentsResponseData>? data =
      jsonConvert.convertListNotNull<AgentsResponseData>(json['data']);
  if (data != null) {
    agentsResponseEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    agentsResponseEntity.message = message;
  }
  return agentsResponseEntity;
}

Map<String, dynamic> $AgentsResponseEntityToJson(AgentsResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

AgentsResponseData $AgentsResponseDataFromJson(Map<String, dynamic> json) {
  final AgentsResponseData agentsResponseData = AgentsResponseData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    agentsResponseData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    agentsResponseData.name = name;
  }
  final String? mobileNumber =
      jsonConvert.convert<String>(json['mobile_number']);
  if (mobileNumber != null) {
    agentsResponseData.mobileNumber = mobileNumber;
  }
  final String? pairRate = jsonConvert.convert<String>(json['pair_rate']);
  if (pairRate != null) {
    agentsResponseData.pairRate = pairRate;
  }
  final String? inOutRate = jsonConvert.convert<String>(json['in_out_rate']);
  if (inOutRate != null) {
    agentsResponseData.inOutRate = inOutRate;
  }
  final String? commission = jsonConvert.convert<String>(json['commission']);
  if (commission != null) {
    agentsResponseData.commission = commission;
  }
  final String? patti = jsonConvert.convert<String>(json['patti']);
  if (patti != null) {
    agentsResponseData.patti = patti;
  }
  final String? referenceCommission =
      jsonConvert.convert<String>(json['reference_commission']);
  if (referenceCommission != null) {
    agentsResponseData.referenceCommission = referenceCommission;
  }
  final String? dailyIncentive =
      jsonConvert.convert<String>(json['daily_incentive']);
  if (dailyIncentive != null) {
    agentsResponseData.dailyIncentive = dailyIncentive;
  }
  final String? referenceId = jsonConvert.convert<String>(json['reference_id']);
  if (referenceId != null) {
    agentsResponseData.referenceId = referenceId;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    agentsResponseData.createdAt = createdAt;
  }
  return agentsResponseData;
}

Map<String, dynamic> $AgentsResponseDataToJson(AgentsResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['mobile_number'] = entity.mobileNumber;
  data['pair_rate'] = entity.pairRate;
  data['in_out_rate'] = entity.inOutRate;
  data['commission'] = entity.commission;
  data['patti'] = entity.patti;
  data['reference_commission'] = entity.referenceCommission;
  data['daily_incentive'] = entity.dailyIncentive;
  data['reference_id'] = entity.referenceId;
  data['created_at'] = entity.createdAt;
  return data;
}
