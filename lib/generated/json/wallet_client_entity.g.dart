import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/wallet_client_entity.dart';

WalletClientEntity $WalletClientEntityFromJson(Map<String, dynamic> json) {
  final WalletClientEntity walletClientEntity = WalletClientEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    walletClientEntity.success = success;
  }
  final List<WalletClientData>? data =
      jsonConvert.convertListNotNull<WalletClientData>(json['data']);
  if (data != null) {
    walletClientEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletClientEntity.message = message;
  }
  return walletClientEntity;
}

Map<String, dynamic> $WalletClientEntityToJson(WalletClientEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

WalletClientData $WalletClientDataFromJson(Map<String, dynamic> json) {
  final WalletClientData walletClientData = WalletClientData();
  final int? agentId = jsonConvert.convert<int>(json['agent_id']);
  if (agentId != null) {
    walletClientData.agentId = agentId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    walletClientData.name = name;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    walletClientData.balance = balance;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    walletClientData.createdAt = createdAt;
  }
  return walletClientData;
}

Map<String, dynamic> $WalletClientDataToJson(WalletClientData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['agent_id'] = entity.agentId;
  data['name'] = entity.name;
  data['balance'] = entity.balance;
  data['created_at'] = entity.createdAt;
  return data;
}
