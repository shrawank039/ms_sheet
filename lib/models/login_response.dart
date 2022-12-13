import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.success,
    this.message,
    this.user,
  });

  bool? success;
  String? message;
  User? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        user: json["data"] == null ? null : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": success,
        "message": message,
        "user": user == null ? null : user?.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.access_token,
    this.phone,
  });

  int? id;
  String? name;
  String? email;
  String? avatar;
  String? access_token;
  String? phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        access_token: json["token"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "access_token": access_token,
        "phone": phone,
      };
}
