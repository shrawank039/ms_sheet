import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/agents_response_entity.dart';
import 'package:ms_sheet/models/assistant_response.dart';
import '../app_config.dart';
import '../models/base_response.dart';
import '../models/signup_response.dart';

class AssistantRepository {

  Future<AssistantResponse> getAssistant() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/assistants");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getSheets : ${response.body}');
    return AssistantResponse.fromJson(json.decode(response.body));
  }

  Future<SignupResponse> addAssitant(
    String name,
    String mobileNumber,
    String password,
    String type,
    int parent_id,
  ) async {
    var postBody = jsonEncode({
      "name": name,
      "mobile_number": mobileNumber,
      "password": password,
      "type": type,
      "parent_id": parent_id
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/register");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('getSignupResponse : ${response.body}');
    return signupResponseFromJson(response.body);
  }

  Future<SignupResponse> updateAssistant(
      int id,
      String name,
      String mobile_number) async {
    var postBody = jsonEncode({
      "name": name,
      "mobile_number": mobile_number,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/assistants/$id");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('updateAssistant : ${response.body}');
    return signupResponseFromJson(response.body);
  }

  Future<AgentsResponseEntity> getAgents() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/agents");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getAgents : ${response.body}');
    return AgentsResponseEntity.fromJson(json.decode(response.body));
  }

  Future<SignupResponse> assignAgents(
    int assistant_id,
      List<int> agent_id) async {
    var postBody = jsonEncode({
      "assistant_id": assistant_id,
      "agent_id": agent_id,
    });
    Uri url = Uri.parse("${AppConfig.BASE_URL}/assistants/clients/assign");
    final response = await http.post(url, headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('assignAgents : $postBody : ${response.body}');
    return signupResponseFromJson(response.body);
  }

  Future<BaseResponse> pointTransfer(
    int assistant_id,
    int points) async {
    var postBody = jsonEncode({
      "assistant_id": assistant_id,
      "points": points,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/assistants/recharge");
    final response = await http.post(url, headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('pointTransfer : $postBody : ${response.body}');
    return BaseResponse.fromJson(json.decode(response.body));
  }

  Future<AgentsResponseEntity> deleteAssistant(int id) async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/assistants/$id");
    final response =
        await http.delete(url, headers: await global.getApiHeaders(true));
    print('deleteAssistant : ${response.body}');
    return AgentsResponseEntity.fromJson(json.decode(response.body));
  }
}

final assitantProvider =
    Provider<AssistantRepository>((ref) => AssistantRepository());
