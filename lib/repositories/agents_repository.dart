import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/agents_response_entity.dart';
import '../app_config.dart';

class AgentsRepository {
  Future<AgentsResponseEntity> addAgent(
      String name,
      String mobile_number,
      String pair_rate,
      String in_out_rate,
      String commission,
      String patti,
      int reference,
      String reference_commission,
      String daily_incentive) async {
    var postBody = jsonEncode({
      "name": name,
      "mobile_number": mobile_number,
      "pair_rate": pair_rate,
      "in_out_rate": in_out_rate,
      "commission": commission,
      "patti": patti,
      "reference_commission": reference_commission,
      "daily_incentive": daily_incentive,
      "reference_id": reference,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/agents");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addAgent : ${response.body}');
    return AgentsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<AgentsResponseEntity> updateAgent(
      int id,
      String name,
      String mobile_number,
      String pair_rate,
      String in_out_rate,
      String commission,
      String patti,
      String reference_id,
      String reference_commission,
      String daily_incentive) async {
    var postBody = jsonEncode({
      "name": name,
      "mobile_number": mobile_number,
      "pair_rate": pair_rate,
      "in_out_rate": in_out_rate,
      "commission": commission,
      "patti": patti,
      "reference_commission": reference_commission,
      "daily_incentive": daily_incentive,
      "reference_id": reference_id,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/agents/$id");
    final response = await http.patch(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('updateAgent : ${response.body}');
    return AgentsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<AgentsResponseEntity> getAgents() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/agents");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getAgents : ${response.body}');
    return AgentsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<AgentsResponseEntity> deleteAgents(int id) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/agents/$id");
    final response =
        await http.delete(url, headers: await global.getApiHeaders(true));
    print('getAgents : ${response.body}');
    return AgentsResponseEntity.fromJson(json.decode(response.body));
  }
}

final agentsProvider = Provider<AgentsRepository>((ref) => AgentsRepository());
