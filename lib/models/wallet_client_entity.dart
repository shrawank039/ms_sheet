import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/wallet_client_entity.g.dart';

@JsonSerializable()
class WalletClientEntity {
  bool? success;
  List<WalletClientData>? data;
  String? message;

  WalletClientEntity();

  factory WalletClientEntity.fromJson(Map<String, dynamic> json) =>
      $WalletClientEntityFromJson(json);

  Map<String, dynamic> toJson() => $WalletClientEntityToJson(this);

  WalletClientEntity copyWith(
      {bool? success, List<WalletClientData>? data, String? message}) {
    return WalletClientEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WalletClientData {
  @JSONField(name: "agent_id")
  int? agentId;
  String? name;
  String? balance;
  @JSONField(name: "created_at")
  String? createdAt;

  WalletClientData();

  factory WalletClientData.fromJson(Map<String, dynamic> json) =>
      $WalletClientDataFromJson(json);

  Map<String, dynamic> toJson() => $WalletClientDataToJson(this);

  WalletClientData copyWith(
      {int? agentId, String? name, String? balance, String? createdAt}) {
    return WalletClientData()
      ..agentId = agentId ?? this.agentId
      ..name = name ?? this.name
      ..balance = balance ?? this.balance
      ..createdAt = createdAt ?? this.createdAt;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
