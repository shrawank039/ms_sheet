import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/local_players_entity.dart';

LocalPlayersEntity $LocalPlayersEntityFromJson(Map<String, dynamic> json) {
  final LocalPlayersEntity localPlayersEntity = LocalPlayersEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    localPlayersEntity.success = success;
  }
  final List<LocalPlayersData>? data =
      jsonConvert.convertListNotNull<LocalPlayersData>(json['data']);
  if (data != null) {
    localPlayersEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    localPlayersEntity.message = message;
  }
  return localPlayersEntity;
}

Map<String, dynamic> $LocalPlayersEntityToJson(LocalPlayersEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

LocalPlayersData $LocalPlayersDataFromJson(Map<String, dynamic> json) {
  final LocalPlayersData localPlayersData = LocalPlayersData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    localPlayersData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    localPlayersData.name = name;
  }
  final String? mobileNumber =
      jsonConvert.convert<String>(json['mobile_number']);
  if (mobileNumber != null) {
    localPlayersData.mobileNumber = mobileNumber;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    localPlayersData.password = password;
  }
  final String? limit = jsonConvert.convert<String>(json['limit']);
  if (limit != null) {
    localPlayersData.limit = limit;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    localPlayersData.createdAt = createdAt;
  }
  return localPlayersData;
}

Map<String, dynamic> $LocalPlayersDataToJson(LocalPlayersData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['mobile_number'] = entity.mobileNumber;
  data['password'] = entity.password;
  data['limit'] = entity.limit;
  data['created_at'] = entity.createdAt;
  return data;
}
