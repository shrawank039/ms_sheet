import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  bool? success;
  Data? data;
  String? message;

  SignupResponse({this.success, this.data, this.message});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;

  Data({this.id, this.name, this.email, this.mobileNumber});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["mobile_number"] is String) {
      mobileNumber = json["mobile_number"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["mobile_number"] = mobileNumber;
    return _data;
  }
}
