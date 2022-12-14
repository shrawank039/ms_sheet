import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/sheets_response.dart';

import '../app_config.dart';

class SheetsRepository {
  Future<SheetsResponse> addSheets(String name, String time) async {
    var postBody = jsonEncode({
      "name": name,
      "end_time": time,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/sheets");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addSheets : ${response.body}');
    return sheetsResponseFromJson(response.body);
  }

  Future<SheetsResponse> getSheets() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/sheets");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getSheets : ${response.body}');
    return sheetsResponseFromJson(response.body);
  }
}
