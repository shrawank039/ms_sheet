import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/wallet_transactions_entity.dart';

WalletTransactionsEntity $WalletTransactionsEntityFromJson(
    Map<String, dynamic> json) {
  final WalletTransactionsEntity walletTransactionsEntity =
      WalletTransactionsEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    walletTransactionsEntity.success = success;
  }
  final WalletTransactionsData? data =
      jsonConvert.convert<WalletTransactionsData>(json['data']);
  if (data != null) {
    walletTransactionsEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletTransactionsEntity.message = message;
  }
  return walletTransactionsEntity;
}

Map<String, dynamic> $WalletTransactionsEntityToJson(
    WalletTransactionsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

WalletTransactionsData $WalletTransactionsDataFromJson(
    Map<String, dynamic> json) {
  final WalletTransactionsData walletTransactionsData =
      WalletTransactionsData();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    walletTransactionsData.name = name;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    walletTransactionsData.balance = balance;
  }
  final List<WalletTransactionsDataTransactions>? transactions =
      jsonConvert.convertListNotNull<WalletTransactionsDataTransactions>(
          json['transactions']);
  if (transactions != null) {
    walletTransactionsData.transactions = transactions;
  }
  return walletTransactionsData;
}

Map<String, dynamic> $WalletTransactionsDataToJson(
    WalletTransactionsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['balance'] = entity.balance;
  data['transactions'] = entity.transactions?.map((v) => v.toJson()).toList();
  return data;
}

WalletTransactionsDataTransactions $WalletTransactionsDataTransactionsFromJson(
    Map<String, dynamic> json) {
  final WalletTransactionsDataTransactions walletTransactionsDataTransactions =
      WalletTransactionsDataTransactions();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    walletTransactionsDataTransactions.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletTransactionsDataTransactions.description = description;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    walletTransactionsDataTransactions.amount = amount;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    walletTransactionsDataTransactions.createdAt = createdAt;
  }
  return walletTransactionsDataTransactions;
}

Map<String, dynamic> $WalletTransactionsDataTransactionsToJson(
    WalletTransactionsDataTransactions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['amount'] = entity.amount;
  data['created_at'] = entity.createdAt;
  return data;
}
