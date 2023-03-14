import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/wallet_transactions_entity.g.dart';

@JsonSerializable()
class WalletTransactionsEntity {
  bool? success;
  WalletTransactionsData? data;
  String? message;

  WalletTransactionsEntity();

  factory WalletTransactionsEntity.fromJson(Map<String, dynamic> json) =>
      $WalletTransactionsEntityFromJson(json);

  Map<String, dynamic> toJson() => $WalletTransactionsEntityToJson(this);

  WalletTransactionsEntity copyWith(
      {bool? success, WalletTransactionsData? data, String? message}) {
    return WalletTransactionsEntity()
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
class WalletTransactionsData {
  String? name;
  String? balance;
  List<WalletTransactionsDataTransactions>? transactions;

  WalletTransactionsData();

  factory WalletTransactionsData.fromJson(Map<String, dynamic> json) =>
      $WalletTransactionsDataFromJson(json);

  Map<String, dynamic> toJson() => $WalletTransactionsDataToJson(this);

  WalletTransactionsData copyWith(
      {String? name,
      String? balance,
      List<WalletTransactionsDataTransactions>? transactions}) {
    return WalletTransactionsData()
      ..name = name ?? this.name
      ..balance = balance ?? this.balance
      ..transactions = transactions ?? this.transactions;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WalletTransactionsDataTransactions {
  String? title;
  String? description;
  String? amount;
  @JSONField(name: "created_at")
  String? createdAt;

  WalletTransactionsDataTransactions();

  factory WalletTransactionsDataTransactions.fromJson(
          Map<String, dynamic> json) =>
      $WalletTransactionsDataTransactionsFromJson(json);

  Map<String, dynamic> toJson() =>
      $WalletTransactionsDataTransactionsToJson(this);

  WalletTransactionsDataTransactions copyWith(
      {String? title, String? description, String? amount, String? createdAt}) {
    return WalletTransactionsDataTransactions()
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
