import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/profile_response.dart';

import '../app_config.dart';
import '../models/login_response.dart';
import '../models/password_confirm_response.dart';
import '../models/signup_response.dart';

class AuthRepository {
  Future<LoginResponse> getLoginResponse(String email, String password) async {
    var postBody = jsonEncode({
      "mobile_number": email,
      "password": password,
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/login");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);

    print('getLoginResponse : ${response.body}');

    return loginResponseFromJson(response.body);
  }

  Future<LoginResponse> getSignupResponse(
    String name,
    //  String email,
    String mobileNumber,
    String password,
    String type,
    int parent_id,
  ) async {
    var postBody = jsonEncode({
      "name": name,
      // "email": email,
      "mobile_number": mobileNumber,
      "password": password,
      "type": type,
      "parent_id": parent_id
    });

    Uri url = Uri.parse("${AppConfig.BASE_URL}/register");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('getSignupResponse : ${response.body}');
    return loginResponseFromJson(response.body);
  }

  Future<SignupResponse> updateProfileResponse(
      String name, String email, String mobileNumber) async {
    var postBody = jsonEncode(
        {"name": name, "email": email, "mobile_number": mobileNumber});

    Uri url = Uri.parse("${AppConfig.BASE_URL}/profile");
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('updateProfileResponse : ${response.body}');
    return signupResponseFromJson(response.body);
  }

  Future<ProfileResponse> getProfileResponse() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/profile");
    final response =
        await http.get(url, headers: await global.getApiHeaders(true));
    debugPrint('getProfileResponse : ${response.body}');
    return profileResponseFromJson(response.body);
  }

  Future<PasswordResponse> changePassword(String password) async {
    var postBody = jsonEncode({"password": password});

    Uri url = Uri.parse(
      "${AppConfig.BASE_URL}/password/change",
    );
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('changePassword : ${response.body}');
    return passwordResponseFromJson(response.body);
  }

  Future<PasswordResponse> getOTP(String mobile_number) async {
    var postBody = jsonEncode({"mobile_number": mobile_number});
    Uri url = Uri.parse(
      "${AppConfig.BASE_URL}/otp/send",
    );
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('getOTP : ${response.body}');
    return passwordResponseFromJson(response.body);
  }

  Future<PasswordResponse> verifyOTP(String mobile_number, String otp) async {
    var postBody = jsonEncode({"mobile_number": mobile_number, "otp": otp});

    Uri url = Uri.parse(
      "${AppConfig.BASE_URL}/otp/verify",
    );
    final response = await http.post(url,
        headers: await global.getApiHeaders(true), body: postBody);
    debugPrint('verifyOTP : ${response.body}');
    return passwordResponseFromJson(response.body);
  }
}
