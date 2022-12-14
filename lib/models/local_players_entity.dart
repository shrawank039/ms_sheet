import 'dart:convert';

import 'package:ms_sheet/generated/json/base/json_field.dart';
import 'package:ms_sheet/generated/json/local_players_entity.g.dart';

@JsonSerializable()
class LocalPlayersEntity {
  bool? success;
  List<LocalPlayersData>? data;
  String? message;

  LocalPlayersEntity();

  factory LocalPlayersEntity.fromJson(Map<String, dynamic> json) =>
      $LocalPlayersEntityFromJson(json);

  Map<String, dynamic> toJson() => $LocalPlayersEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LocalPlayersData {
  int? id;
  String? name;
  @JSONField(name: "mobile_number")
  String? mobileNumber;
  String? password;
  String? limit;
  @JSONField(name: "created_at")
  String? createdAt;

  LocalPlayersData();

  factory LocalPlayersData.fromJson(Map<String, dynamic> json) =>
      $LocalPlayersDataFromJson(json);

  Map<String, dynamic> toJson() => $LocalPlayersDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
