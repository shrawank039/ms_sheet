import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;

import '../app_config.dart';
import '../models/sheets_response_entity.dart';

class SheetsRepository {
  Future<SheetsResponseEntity> addSheets(String name, String time) async {
    var postBody = jsonEncode({
      "name": name,
      "end_time": time,
      "pair_key":[].toString(),
      "pair_value":[].toString(),
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/sheets");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addSheets : ${response.body}');
    return SheetsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<SheetsResponseEntity> getSheets() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/sheets");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getSheets : ${response.body}');
    return SheetsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<SheetsResponseEntity> getSheetsHistory(String date) async {
    var postBody = jsonEncode({
      "date": date,
    });
    Uri url = Uri.parse("${AppConfig.BASE_URL}/sheets/history");
    final response =
    await http.post(url, headers: await global.getApiHeaders(true), body: postBody);
    print('getSheetsHistory : ${response.body}');
    return SheetsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<SheetsResponseEntity> deleteSheets(int id) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/sheets/$id");
    final response =
        await http.delete(url, headers: await global.getApiHeaders(true));
    print('deleteSheets : ${response.body}');
    return SheetsResponseEntity.fromJson(json.decode(response.body));
  }
}

var sheetsProvider = Provider<SheetsRepository>((ref) => SheetsRepository());
