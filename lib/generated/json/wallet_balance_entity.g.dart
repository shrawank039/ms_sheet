import 'package:ms_sheet/generated/json/base/json_convert_content.dart';
import 'package:ms_sheet/models/wallet_balance_entity.dart';

WalletBalanceEntity $WalletBalanceEntityFromJson(Map<String, dynamic> json) {
  final WalletBalanceEntity walletBalanceEntity = WalletBalanceEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    walletBalanceEntity.success = success;
  }
  final WalletBalanceData? data =
      jsonConvert.convert<WalletBalanceData>(json['data']);
  if (data != null) {
    walletBalanceEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletBalanceEntity.message = message;
  }
  return walletBalanceEntity;
}

Map<String, dynamic> $WalletBalanceEntityToJson(WalletBalanceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

WalletBalanceData $WalletBalanceDataFromJson(Map<String, dynamic> json) {
  final WalletBalanceData walletBalanceData = WalletBalanceData();
  final int? inAmount = jsonConvert.convert<int>(json['in_amount']);
  if (inAmount != null) {
    walletBalanceData.inAmount = inAmount;
  }
  final int? outAmount = jsonConvert.convert<int>(json['out_amount']);
  if (outAmount != null) {
    walletBalanceData.outAmount = outAmount;
  }
  return walletBalanceData;
}

Map<String, dynamic> $WalletBalanceDataToJson(WalletBalanceData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['in_amount'] = entity.inAmount;
  data['out_amount'] = entity.outAmount;
  return data;
}
