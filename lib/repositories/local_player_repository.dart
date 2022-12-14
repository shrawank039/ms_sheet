import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/local_players_entity.dart';

import '../app_config.dart';

class LocalPlayersRepository {
  Future<LocalPlayersEntity> addLocalPlayers(
      String name, String mobile_number, String password, String limit) async {
    var postBody = jsonEncode({
      "name": name,
      "mobile_number": mobile_number,
      "password": password,
      "limit": limit,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/local-players");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    print('addLocalPlayers : ${response.body}');
    return LocalPlayersEntity.fromJson(json.decode(response.body));
  }

  Future<LocalPlayersEntity> getLocalPlayers() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/local-players");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    print('getLocalPlayers : ${response.body}');
    return LocalPlayersEntity.fromJson(json.decode(response.body));
  }
}
