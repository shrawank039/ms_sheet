import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/screens/login/otp_page.dart';
import 'package:sizer/sizer.dart';
import '../../../helper/auth_helper.dart';
import '../../../repositories/auth_repository.dart';
import '../../styles/color.dart';
import '../../styles/design.dart';
import '../home/home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController _controllerName;
  late TextEditingController _controllerMobile;
  late TextEditingController _controllerPass;

  @override
  void initState() {
    _controllerName = TextEditingController(text: '');
    _controllerMobile = TextEditingController(text: '');
    _controllerPass = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          width: 100.w<640 ? 80.w: 500.0,
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
                        'Register',
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
                      'Enter your basic details and verify phone to register and proceed.',
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
              DesignConfig.inputBoxPassword(
                  ColorsRes.lightBlue,
                  1.5.w,
                  17,
                  'Enter Password',
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
                      Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Otp(_controllerName.text, _controllerMobile.text, _controllerPass.text, 'register')));
                    },
                    child: Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      child: const Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorsRes.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
