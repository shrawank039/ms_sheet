import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/panel_response_entity.dart';

import '../app_config.dart';

class PanelRepository {
  Future<PanelResponseEntity> addPanel(
      int sheet_id, int agent_id, String date, var pair) async {
    var postBody = jsonEncode({
      "sheet_id": sheet_id,
      "agent_id": agent_id,
      "date": date,
      "pair": pair,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/e-panels");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addPanel : ${response.body}');
    return PanelResponseEntity.fromJson(json.decode(response.body));
  }

  Future<PanelResponseEntity> updatePanel(
      int sheet_id, int agent_id, String date, var pair) async {
    var postBody = jsonEncode({
      "sheet_id": sheet_id,
      "agent_id": agent_id,
      "date": date,
      "pair": pair,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/e-panels/$sheet_id");
    final response = await http.patch(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('updatePanel : ${response.body}');
    return PanelResponseEntity.fromJson(json.decode(response.body));
  }

  Future<PanelResponseEntity> getPanel(int sheet_id, String date) async {
    var postBody = jsonEncode({
      "sheet_id": sheet_id,
      "date": date,
    });
    Uri url = Uri.parse("${AppConfig.BASE_URL}/e-panels/show");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('getPanel : ${response.body}');
    return PanelResponseEntity.fromJson(json.decode(response.body));
  }

  Future<PanelResponseEntity> deletePanel(int id) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/e-panels/$id");
    final response =
        await http.delete(url, headers: await global.getApiHeaders(true));
    print('deleteLocalPlayers : ${response.body}');
    return PanelResponseEntity.fromJson(json.decode(response.body));
  }
}

var panelProvider = Provider<PanelRepository>((ref) => PanelRepository());
