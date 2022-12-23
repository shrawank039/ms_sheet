import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/counters_entity.dart';

import '../app_config.dart';

class CountersRepository {
  Future<CountersEntity> addCounters(
    String name,
    String mobile_number,
    String pair_rate,
    String in_out_rate,
    String commission,
    String patti,
  ) async {
    var postBody = jsonEncode({
      "name": name,
      "mobile_number": mobile_number,
      "pair_rate": pair_rate,
      "in_out_rate": in_out_rate,
      "commission": commission,
      "patti": patti
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/counters");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addCounters : ${response.body}');
    return CountersEntity.fromJson(json.decode(response.body));
  }

  Future<CountersEntity> getCounters() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/counters");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getCounters : ${response.body}');
    return CountersEntity.fromJson(json.decode(response.body));
  }

  Future<CountersEntity> deleteCounters(int id) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/counters/$id");
    final response =
        await http.delete(url, headers: await global.getApiHeaders(true));
    print('deleteCounters : ${response.body}');
    return CountersEntity.fromJson(json.decode(response.body));
  }
}

var countersProvider =
    Provider<CountersRepository>((ref) => CountersRepository());
