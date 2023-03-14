import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/wallet_balance_entity.dart';
import 'package:ms_sheet/models/wallet_transactions_entity.dart';

import '../app_config.dart';
import '../models/wallet_add_transaction_entity.dart';
import '../models/wallet_client_entity.dart';

class WalletRepo {
  Future<WalletClientEntity> getWalletClient() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wallets/clients");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getWalletClients : ${response.body}');
    return WalletClientEntity.fromJson(json.decode(response.body));
  }

  Future<WalletBalanceEntity> getWalletBal() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wallets/balance");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getWalletBalance : ${response.body}');
    return WalletBalanceEntity.fromJson(json.decode(response.body));
  }

  Future<WalletTransactionsEntity> getTransaction(int clientID) async {
    Uri url = Uri.parse(
        "${AppConfig.BASE_URL}/wallets/transactions/client/$clientID");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getTransaction : ${response.body}');
    return WalletTransactionsEntity.fromJson(json.decode(response.body));
  }

  Future<WalletAddTransactionEntity> addTransaction(
      int clientID, String type, String amount, String title) async {
    var postBody = jsonEncode({
      "agent_id": clientID,
      "transaction_type": type,
      "title": title,
      "amount": amount
    });
    Uri url = Uri.parse("${AppConfig.BASE_URL}/wallets/transactions/create");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addTransaction : ${response.body}');
    return WalletAddTransactionEntity.fromJson(json.decode(response.body));
  }
}

final walletProvider = Provider<WalletRepo>((ref) => WalletRepo());
