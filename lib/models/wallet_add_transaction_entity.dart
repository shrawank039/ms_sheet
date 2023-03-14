import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/wallet_add_transaction_entity.g.dart';

@JsonSerializable()
class WalletAddTransactionEntity {
  bool? success;
  WalletAddTransactionData? data;
  String? message;

  WalletAddTransactionEntity();

  factory WalletAddTransactionEntity.fromJson(Map<String, dynamic> json) =>
      $WalletAddTransactionEntityFromJson(json);

  Map<String, dynamic> toJson() => $WalletAddTransactionEntityToJson(this);

  WalletAddTransactionEntity copyWith(
      {bool? success, WalletAddTransactionData? data, String? message}) {
    return WalletAddTransactionEntity()
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
class WalletAddTransactionData {
  String? title;
  String? description;
  String? amount;
  @JSONField(name: "created_at")
  String? createdAt;

  WalletAddTransactionData();

  factory WalletAddTransactionData.fromJson(Map<String, dynamic> json) =>
      $WalletAddTransactionDataFromJson(json);

  Map<String, dynamic> toJson() => $WalletAddTransactionDataToJson(this);

  WalletAddTransactionData copyWith(
      {String? title, String? description, String? amount, String? createdAt}) {
    return WalletAddTransactionData()
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..amount = amount ?? this.amount
      ..createdAt = createdAt ?? this.createdAt;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
