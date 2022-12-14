import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/counters_entity.dart';

CountersEntity $CountersEntityFromJson(Map<String, dynamic> json) {
  final CountersEntity countersEntity = CountersEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    countersEntity.success = success;
  }
  final List<CountersData>? data =
      jsonConvert.convertListNotNull<CountersData>(json['data']);
  if (data != null) {
    countersEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    countersEntity.message = message;
  }
  return countersEntity;
}

Map<String, dynamic> $CountersEntityToJson(CountersEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

CountersData $CountersDataFromJson(Map<String, dynamic> json) {
  final CountersData countersData = CountersData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    countersData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    countersData.name = name;
  }
  final String? mobileNumber =
      jsonConvert.convert<String>(json['mobile_number']);
  if (mobileNumber != null) {
    countersData.mobileNumber = mobileNumber;
  }
  final String? pairRate = jsonConvert.convert<String>(json['pair_rate']);
  if (pairRate != null) {
    countersData.pairRate = pairRate;
  }
  final String? inOutRate = jsonConvert.convert<String>(json['in_out_rate']);
  if (inOutRate != null) {
    countersData.inOutRate = inOutRate;
  }
  final String? commission = jsonConvert.convert<String>(json['commission']);
  if (commission != null) {
    countersData.commission = commission;
  }
  final String? patti = jsonConvert.convert<String>(json['patti']);
  if (patti != null) {
    countersData.patti = patti;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    countersData.createdAt = createdAt;
  }
  return countersData;
}

Map<String, dynamic> $CountersDataToJson(CountersData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['mobile_number'] = entity.mobileNumber;
  data['pair_rate'] = entity.pairRate;
  data['in_out_rate'] = entity.inOutRate;
  data['commission'] = entity.commission;
  data['patti'] = entity.patti;
  data['created_at'] = entity.createdAt;
  return data;
}
