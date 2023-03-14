import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/agents_response_entity.dart';
import 'package:ms_sheet/models/counters_entity.dart';
import 'package:ms_sheet/models/local_players_entity.dart';
import 'package:ms_sheet/models/wallet_balance_entity.dart';
import 'package:ms_sheet/models/wallet_transactions_entity.dart';
import 'package:ms_sheet/repositories/counters_repository.dart';
import 'package:ms_sheet/repositories/panel_repository.dart';
import 'package:ms_sheet/repositories/sheets_repository.dart';

import '../models/panel_response_entity.dart';
import '../models/sheets_response_entity.dart';
import '../models/wallet_client_entity.dart';
import '../repositories/agents_repository.dart';
import '../repositories/local_player_repository.dart';
import '../repositories/wallet_repo.dart';

final agentsDataProvider =
    FutureProvider.autoDispose<AgentsResponseEntity>((ref) async {
  return ref.watch(agentsProvider).getAgents();
});

final localPlayerDataProvider =
    FutureProvider.autoDispose<LocalPlayersEntity>((ref) async {
  return ref.watch(localPlayerProvider).getLocalPlayers();
});

final counterDataProvider =
    FutureProvider.autoDispose<CountersEntity>((ref) async {
  return ref.watch(countersProvider).getCounters();
});

final sheetDataProvider =
    FutureProvider.autoDispose<SheetsResponseEntity>((ref) async {
  return ref.watch(sheetsProvider).getSheets();
});

final sheetHomeDataProvider =
    FutureProvider.autoDispose<SheetsResponseEntity>((ref) async {
  return ref.watch(sheetsProvider).getSheetsHome();
});

final panelDataProvider = FutureProvider.autoDispose
    .family<PanelResponseEntity, ExtraDataParameter>((ref, data) async {
  return ref.watch(panelProvider).getPanel(data.dataList[0], data.dataList[1]);
});

final numberPairProvider = FutureProvider.autoDispose<Map<int, int>>((ref) {
  return global.numberPair;
});

final walletClinetsDataProvider =
    FutureProvider.autoDispose<WalletClientEntity>((ref) async {
  return ref.watch(walletProvider).getWalletClient();
});

final walletBalDataProvider =
    FutureProvider.autoDispose<WalletBalanceEntity>((ref) async {
  return ref.watch(walletProvider).getWalletBal();
});

final clientTranDataProvider = FutureProvider.autoDispose
    .family<WalletTransactionsEntity, ExtraDataParameter>((ref, data) async {
  return ref.watch(walletProvider).getTransaction(data.dataList[0]);
});

// Extra Data Class
class ExtraDataParameter extends Equatable {
  final List<dynamic> dataList;

  const ExtraDataParameter({required this.dataList});
  @override
  List<Object?> get props => [dataList];
}
