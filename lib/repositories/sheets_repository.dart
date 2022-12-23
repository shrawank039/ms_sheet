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
}

var sheetsProvider = Provider<SheetsRepository>((ref) => SheetsRepository());