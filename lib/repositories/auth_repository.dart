import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart';
import '../helper/shared_value_helper.dart';
import '../models/login_response.dart';
import '../models/password_confirm_response.dart';
import '../models/signup_response.dart';
import '../models/user_by_token.dart';

class AuthRepository {
  Future<LoginResponse> getLoginResponse(
      @required String email, @required String password) async {
    var post_body = jsonEncode({
      "email": "${email}",
      "password": "$password",
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/api/login");
    final response = await http.post(url,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
        },
        body: post_body);
    print('getLoginResponse : ${response.body}');
    return loginResponseFromJson(response.body);
  }

  Future<LoginResponse> getSocialLoginResponse(@required String social_provider,
      @required String name, @required String email, @required String provider,
      {access_token = ""}) async {
    email = email == ("null") ? "" : email;

    var post_body = jsonEncode({
      "name": "${name}",
      "email": email,
      "provider": "$provider",
      "social_provider": "$social_provider",
      "access_token": "$access_token"
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/auth/social-login");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);
    print(post_body);
    print(response.body.toString());
    return loginResponseFromJson(response.body);
  }

  Future<SignupResponse> getSignupResponse(
      @required String name,
      @required String email_or_phone,
      @required String password,
      @required String passowrd_confirmation,
      @required String register_by) async {
    var post_body = jsonEncode({
      "name": "$name",
      "email_or_phone": "${email_or_phone}",
      "password": "$password",
      "password_confirmation": "${passowrd_confirmation}",
      "register_by": "$register_by"
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/auth/signup");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);

    return signupResponseFromJson(response.body);
  }

  Future<PasswordConfirmResponse> getPasswordConfirmResponse(
      @required String verification_code, @required String password) async {
    var post_body = jsonEncode(
        {"verification_code": "$verification_code", "password": "$password"});

    Uri url = Uri.parse(
      "${AppConfig.BASE_URL}/auth/password/confirm_reset",
    );
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);

    return passwordConfirmResponseFromJson(response.body);
  }

  Future<UserByTokenResponse> getUserByTokenResponse() async {
    var post_body = jsonEncode({"access_token": "${access_token.$}"});
    Uri url = Uri.parse("${AppConfig.BASE_URL}/get-user-by-access_token");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);

    return userByTokenResponseFromJson(response.body);
  }
}
