import 'package:ms_sheet/global.dart' as global;

class AuthHelper {
  setUserData(loginResponse) async {
    if (loginResponse.success == true) {
      await global.prefs.setString('token', loginResponse.user.token);
      await global.prefs.setInt('id', loginResponse.user.id);
      await global.prefs.setString('name', loginResponse.user.name);
     // await global.prefs.setString('email', loginResponse.user.email);
      await global.prefs.setString('mobile_number', loginResponse.user.mobile_number);
    }
  }

  clearUserData() async {
    await global.prefs.remove('token');
    await global.prefs.remove('id');
    await global.prefs.remove('name');
  //  await global.prefs.remove('email');
    await global.prefs.remove('mobile_number');
  }
}
