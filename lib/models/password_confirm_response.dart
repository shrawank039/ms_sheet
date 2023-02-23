import 'dart:convert';

PasswordResponse passwordResponseFromJson(String str) =>
    PasswordResponse.fromJson(json.decode(str));

String passwordResponseToJson(PasswordResponse data) => json.encode(data.toJson());

class PasswordResponse {
  bool? success;
  String? message;

  PasswordResponse({this.success, this.message});

  PasswordResponse.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    return _data;
  }
}