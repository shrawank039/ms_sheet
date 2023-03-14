import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/wallet_add_transaction_entity.dart';

WalletAddTransactionEntity $WalletAddTransactionEntityFromJson(
    Map<String, dynamic> json) {
  final WalletAddTransactionEntity walletAddTransactionEntity =
      WalletAddTransactionEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    walletAddTransactionEntity.success = success;
  }
  final WalletAddTransactionData? data =
      jsonConvert.convert<WalletAddTransactionData>(json['data']);
  if (data != null) {
    walletAddTransactionEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletAddTransactionEntity.message = message;
  }
  return walletAddTransactionEntity;
}

Map<String, dynamic> $WalletAddTransactionEntityToJson(
    WalletAddTransactionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

WalletAddTransactionData $WalletAddTransactionDataFromJson(
    Map<String, dynamic> json) {
  final WalletAddTransactionData walletAddTransactionData =
      WalletAddTransactionData();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    walletAddTransactionData.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletAddTransactionData.description = description;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    walletAddTransactionData.amount = amount;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    walletAddTransactionData.createdAt = createdAt;
  }
  return walletAddTransactionData;
}

Map<String, dynamic> $WalletAddTransactionDataToJson(
    WalletAddTransactionData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['amount'] = entity.amount;
  data['created_at'] = entity.createdAt;
  return data;
}
