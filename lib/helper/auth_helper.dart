import 'package:ms_sheet/helper/shared_value_helper.dart';

import '../repositories/auth_repository.dart';

class AuthHelper {
  setUserData(loginResponse) {
    if (loginResponse.result == true) {
      is_logged_in.$ = true;
      is_logged_in.save();
      access_token.$ = loginResponse.user.access_token;
      access_token.save();
      user_id.$ = loginResponse.user.id;
      user_id.save();
      user_name.$ = loginResponse.user.name;
      user_name.save();
      user_email.$ = loginResponse.user.email;
      user_email.save();
      user_phone.$ = loginResponse.user.phone;
      user_phone.save();
      avatar.$ = loginResponse.user.avatar_original;
      avatar.save();
    }
  }

  clearUserData() {
    is_logged_in.$ = false;
    is_logged_in.save();
    access_token.$ = "";
    access_token.save();
    user_id.$ = 0;
    user_id.save();
    user_name.$ = "";
    user_name.save();
    user_email.$ = "";
    user_email.save();
    user_phone.$ = "";
    user_phone.save();
    avatar.$ = "";
    avatar.save();
  }

  fetch_and_set() async {
    var userByTokenResponse = await AuthRepository().getUserByTokenResponse();

    if (userByTokenResponse.result == true) {
      is_logged_in.$ = true;
      is_logged_in.save();
      user_id.$ = userByTokenResponse.id!;
      user_id.save();
      user_name.$ = userByTokenResponse.name!;
      user_name.save();
      user_email.$ = userByTokenResponse.email!;
      user_email.save();
      user_phone.$ = userByTokenResponse.phone!;
      user_phone.save();
      avatar.$ = userByTokenResponse.avatar!;
      avatar.save();
    } else {
      is_logged_in.$ = false;
      is_logged_in.save();
      user_id.$ = 0;
      user_id.save();
      user_name.$ = "";
      user_name.save();
      user_email.$ = "";
      user_email.save();
      user_phone.$ = "";
      user_phone.save();
      avatar.$ = "";
      avatar.save();
    }
  }
}
