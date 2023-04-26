import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/screens/login/login_screen.dart';
import 'package:ms_sheet/ui/screens/login/otp_page.dart';
import 'package:sizer/sizer.dart';
import '../../../helper/auth_helper.dart';
import '../../../repositories/auth_repository.dart';
import '../../styles/color.dart';
import '../../styles/design.dart';
import 'package:ms_sheet/global.dart' as global;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerMobile;
  late TextEditingController _controllerEmail;

  @override
  void initState() {
    _controllerName =
        TextEditingController(text: '${global.prefs.get('name')}');
    _controllerMobile =
        TextEditingController(text: '${global.prefs.get('mobile_number')}');
    _controllerEmail =
        TextEditingController(text: '${global.prefs.get('email')}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          width: 100.w < 640 ? 80.w : 500.0,
          // padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(1.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        hoverColor: Colors.transparent,
                        child: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'You can see/update your profile details here.',
                      style: TextStyle(
                          fontSize: 6.0.sp,
                          color: Colors.black.withOpacity(0.3)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              DesignConfig.inputBoxDecorated(
                  ColorsRes.lightBlue,
                  1.5.w,
                  17,
                  'Enter Name',
                  Icons.monetization_on,
                  5.w,
                  TextInputType.text,
                  _controllerName),
              DesignConfig.inputBoxDecorated(
                  ColorsRes.lightBlue,
                  1.5.w,
                  17,
                  'Enter Phone',
                  Icons.monetization_on,
                  5.w,
                  TextInputType.phone,
                  _controllerMobile),
              DesignConfig.inputBoxDecorated(
                  ColorsRes.lightBlue,
                  1.5.w,
                  17,
                  'Enter Email',
                  Icons.monetization_on,
                  5.w,
                  TextInputType.emailAddress,
                  _controllerEmail),
              GestureDetector(
                onTap: () {
                    Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
          (route) => false,//if you want to disable back feature set to false
            );
                  AuthHelper().clearUserData();
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    'Click to Logout',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: ColorsRes.mainBlue),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Card(
                margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                color: ColorsRes.mainBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5.w)),
                child: InkWell(
                  onTap: () async {
                    var registerResponse = await AuthRepository()
                        .updateProfileResponse(_controllerName.text,
                            _controllerMobile.text, _controllerEmail.text);
                    if (registerResponse.success = true) {
                      AuthHelper().setUserData(registerResponse);
                    }
                  },
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: const Text(
                      'Update',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorsRes.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
