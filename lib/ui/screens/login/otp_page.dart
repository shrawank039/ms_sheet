import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/screens/login/reset_pass_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';
import '../../../helper/auth_helper.dart';
import '../../../helper/function.dart';
import '../../../repositories/auth_repository.dart';
import '../../../widgets/widgets.dart';
import '../../loading.dart';
import '../../styles/styles.dart';
import '../home/home.dart';
import '../noInternet/nointernet.dart';

class Otp extends StatefulWidget {
  final String name, mobile, pass, type;
  const Otp(this.name, this.mobile, this.pass, this.type, {Key? key})
      : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String otpNumber = ''; //otp number
  List otpText = []; //otp number as list for 6 boxes
  List otpPattern = [1, 2, 3, 4]; //list to create number of input box
  var resendTime = 60; //otp resend time
  late Timer timer; //timer for resend time
//otp error string to show if error occurs in otp validation
  TextEditingController otpController =
      TextEditingController(); //otp textediting controller
  bool _loading = false; //loading screen showing

  @override
  void initState() {
    _loading = false;
    timers();
    getOtp();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel;
    super.dispose();
  }

  getOtp() async {
    var verifyResponse = await AuthRepository().getOTP(widget.mobile);
    if (verifyResponse.success = true) {
    } else {}
  }

//otp is false
  otpFalse() async {
    _loading = true;
    otpController.text = '1234';
    otpNumber = otpController.text;
  }

//auto verify otp
  verifyOtp(String otpNumber) async {
    try {
    
      credentials = null;
      // await FirebaseAuth.instance.signInWithCredential(credentials);
      var verifyResponse =
          await AuthRepository().verifyOTP(widget.mobile, otpNumber);
      if (verifyResponse.success = true) {
        if (widget.type == 'register') {
        var registerResponse = await AuthRepository().getSignupResponse(
            widget.name, widget.mobile, widget.pass, 'admin', 0);
        if (registerResponse.success = true) {
          await AuthHelper().setUserData(registerResponse);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
      } else if (widget.type == 'pass') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ResetPassScreen()));
      }
      } 
      
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-verification-code') {
        setState(() {
          otpController.clear();
          otpNumber = '';
        });
      }
    }
  }

// running resend otp timer
  timers() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime != 0) {
        if (mounted) {
          setState(() {
            resendTime--;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Center(
        child: ValueListenableBuilder(
            valueListenable: valueNotifierHome.value,
            builder: (context, value, child) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: media.width * 0.08,
                        right: media.width * 0.08,
                        top: media.width * 0.05 +
                            MediaQuery.of(context).padding.top),
                    color: Colors.white,
                    height: media.height * 1,
                    width: media.width * 0.5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  hoverColor: Colors.transparent,
                                  child: const Icon(Icons.arrow_back)),
                              SizedBox(
                                height: media.height * 0.04,
                              ),
                              SizedBox(
                                width: media.width * 1,
                                child: Text(
                                  'Verify OTP',
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
                                'You will receive an OTP in the given mobile number',
                                style: TextStyle(
                                    fontSize: 6.0.sp,
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '+91 ${widget.mobile}',
                                style: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: media.height * 0.1),
                              Container(
                                alignment: Alignment.center,
                                child: OTPTextField(
                                  length: 4,
                                  width: 80.w,
                                  style: TextStyle(fontSize: 8.sp),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.box,
                                  fieldWidth: 6.w,
                                  onCompleted: (pin) {
                                    setState(() {
                                      otpNumber = pin;
                                    });
                                    if (pin.length == 4) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: media.height * 0.15,
                              ),
                              Container(
                                width: media.width,
                                height: 60,
                                alignment: Alignment.center,
                                child: Button(
                                  onTap: () async {
                                    if (otpNumber.length == 4) {
                                      timer.cancel();
                                      setState(() {
                                        _loading = true;
                                      });
                                      // firebase code send true
                                      try {
                                        verifyOtp(otpNumber);
                                        // PhoneAuthCredential credential =
                                        //     PhoneAuthProvider.credential(
                                        //         verificationId: verId,
                                        //         smsCode: otpNumber);

                                        // // Sign the user in (or link) with the credential
                                        // await FirebaseAuth.instance
                                        //     .signInWithCredential(credential);

                                        // var verify = true;
                                        // if (verify == true) {
                                        //   var loginResponse =
                                        //       await AuthRepository()
                                        //           .getLoginResponse(
                                        //               'aeimesh@gmail.com',
                                        //               '123456');
                                        //   if (loginResponse.success = true) {
                                        //     AuthHelper()
                                        //         .setUserData(loginResponse);
                                        //     debugPrint(
                                        //         'AuthHelper3 : Bearer ${global.prefs.get('access_token')}');
                                        //     Navigator.pushReplacement(
                                        //         context,
                                        //         MaterialPageRoute(
                                        //             builder: (context) =>
                                        //                 Home()));
                                        //   }
                                        // }
                                      } on FirebaseAuthException catch (error) {
                                        if (error.code == 'Invalid OTP') {
                                          setState(() {
                                            otpController.clear();
                                            otpNumber = '';
                                            _loading = false;
                                          });
                                        }
                                      }
                                    } else if (resendTime == 0 &&
                                        otpNumber.length != 4) {
                                      setState(() {
                                        setState(() {
                                          resendTime = 60;
                                        });
                                        timers();
                                      });
                                      phoneAuth('+91${widget.mobile}');
                                    }
                                  },
                                  borcolor:
                                      (resendTime != 0 && otpNumber.length != 4)
                                          ? underline
                                          : null,
                                  text: (otpNumber.length == 4)
                                      ? 'Verify'
                                      : (resendTime == 0)
                                          ? 'Resend'
                                          : 'Resend' +
                                              ' ' +
                                              resendTime.toString(),
                                  color:
                                      (resendTime != 0 && otpNumber.length != 4)
                                          ? underline
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //no internet
                  (internet == false)
                      ? Positioned(
                          top: 0,
                          child: NoInternet(
                            onTap: () {
                              setState(() {
                                internetTrue();
                              });
                            },
                          ))
                      : Container(),

                  //loader
                  (_loading == true)
                      ? Positioned(
                          top: 0,
                          child: SizedBox(
                            height: media.height * 1,
                            width: media.width * 1,
                            child: const Loading(),
                          ))
                      : Container()
                ],
              );
            }),
      ),
    );
  }
}
