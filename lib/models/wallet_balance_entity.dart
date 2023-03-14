import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/wallet_balance_entity.g.dart';

@JsonSerializable()
class WalletBalanceEntity {
  bool? success;
  WalletBalanceData? data;
  String? message;

  WalletBalanceEntity();

  factory WalletBalanceEntity.fromJson(Map<String, dynamic> json) =>
      $WalletBalanceEntityFromJson(json);

  Map<String, dynamic> toJson() => $WalletBalanceEntityToJson(this);

  WalletBalanceEntity copyWith(
      {bool? success, WalletBalanceData? data, String? message}) {
    return WalletBalanceEntity()
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
class WalletBalanceData {
  @JSONField(name: "in_amount")
  int? inAmount;
  @JSONField(name: "out_amount")
  int? outAmount;

  WalletBalanceData();

  factory WalletBalanceData.fromJson(Map<String, dynamic> json) =>
      $WalletBalanceDataFromJson(json);

  Map<String, dynamic> toJson() => $WalletBalanceDataToJson(this);

  WalletBalanceData copyWith({int? inAmount, int? outAmount}) {
    return WalletBalanceData()
      ..inAmount = inAmount ?? this.inAmount
      ..outAmount = outAmount ?? this.outAmount;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
