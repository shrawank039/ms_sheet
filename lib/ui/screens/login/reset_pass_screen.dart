import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/auth_helper.dart';
import '../../../repositories/auth_repository.dart';
import '../../styles/color.dart';
import '../../styles/design.dart';
import '../home/home.dart';

class ResetPassScreen extends StatefulWidget {
  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPass;

  @override
  void initState() {
    _controllerEmail = TextEditingController(text: '');
    _controllerPass = TextEditingController(text: '');
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
                        'New Password',
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
                      'Alphanumeric password which containg special character are more secured.',
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
                  'New Password',
                  Icons.monetization_on,
                  5.w,
                  TextInputType.visiblePassword,
                  _controllerEmail),
              DesignConfig.inputBoxPassword(
                  ColorsRes.lightBlue,
                  1.5.w,
                  17,
                  'Re-Enter Password',
                  Icons.monetization_on,
                  5.w,
                  TextInputType.visiblePassword,
                  _controllerPass),
              const SizedBox(height: 50),
              Card(
                margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                color: ColorsRes.mainBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5.w)),
                child: InkWell(
                  onTap: () async {
                    if (_controllerEmail.text == _controllerPass.text) {
                      var passResponse = await AuthRepository()
                          .changePassword(_controllerPass.text);
                      if (passResponse.success = true) {
                        Navigator.pop(context);
                      }
                    } else {}
                  },
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: const Text(
                      'Submit',
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
