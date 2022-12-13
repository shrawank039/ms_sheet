import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/function.dart';
import '../../../repositories/auth_repository.dart';
import '../../../widgets/widgets.dart';
import '../../loading.dart';
import '../../styles/styles.dart';
import '../home/home.dart';
import '../noInternet/nointernet.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String otpNumber = ''; //otp number
  List otpText = []; //otp number as list for 6 boxes
  List otpPattern = [1, 2, 3, 4, 5, 6]; //list to create number of input box
  var resendTime = 60; //otp resend time
  late Timer timer; //timer for resend time
  String _error =
      ''; //otp error string to show if error occurs in otp validation
  TextEditingController otpController =
      TextEditingController(); //otp textediting controller
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  TextEditingController fifth = TextEditingController();
  TextEditingController sixth = TextEditingController();
  bool _loading = false; //loading screen showing
  String phnumber = '1234567890';

  @override
  void initState() {
    _loading = false;
    timers();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel;
    super.dispose();
  }

//otp is false
  otpFalse() async {
    _loading = true;
    otpController.text = '123456';
    otpNumber = otpController.text;
  }

//auto verify otp
  verifyOtp() async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credentials);

      var verify = true;
      credentials = null;

      if (verify == true) {
        var loginResponse = await AuthRepository()
            .getLoginResponse('aeimesh@gmail.com', '123456');
        if (loginResponse.success = true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-verification-code') {
        setState(() {
          otpController.clear();
          otpNumber = '';
          _error = 'Wrong OTP!!!';
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
      child: Container(
        child: ValueListenableBuilder(
            valueListenable: valueNotifierHome.value,
            builder: (context, value, child) {
              if (credentials != null) {
                _loading = true;
                verifyOtp();
              }
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: media.width * 0.08,
                        right: media.width * 0.08,
                        top: media.width * 0.05 +
                            MediaQuery.of(context).padding.top),
                    color: Colors.white,
                    height: media.height * 1,
                    width: media.width * 1,
                    child: Column(
                      children: [
                        Container(
                            width: media.width * 1,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.arrow_back)),
                              ],
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: media.height * 0.04,
                              ),
                              SizedBox(
                                width: media.width * 1,
                                child: Text(
                                  'Verify OTP',
                                  style: TextStyle(
                                      fontSize: 18.0.sp,
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
                                    fontSize: 10.0.sp,
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '+91' + phnumber,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: media.height * 0.1),
                              Container(
                                alignment: Alignment.center,
                                child: OTPTextField(
                                  length: 6,
                                  width: 80.w,
                                  style: TextStyle(fontSize: 15.sp),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.box,
                                  fieldWidth: 10.w,
                                  onCompleted: (pin) {
                                    setState(() {
                                      otpNumber = pin;
                                    });
                                    if (pin.length == 6) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                ),
                              ),
                              /*SizedBox(height: media.height * 0.1),
                              Container(
                                height: media.width * 0.15,
                                width: media.width * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 1.2)),
                                child: TextField(
                                  controller: otpController,
                                  autofocus:
                                      (phoneAuthCheck == false) ? false : true,
                                  onChanged: (val) {
                                    setState(() {
                                      otpNumber = val;
                                    });
                                    if (val.length == 6) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      counterText: '',
                                      hintText: 'Enter OTP'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLength: 6,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              // show error on otp
                              (_error != '')
                                  ? Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: media.height * 0.02),
                                      child: Text(
                                        _error,
                                        style: TextStyle(
                                            fontSize: 2.2.w, color: Colors.red),
                                      ),
                                    )
                                  : Container(),*/
                              SizedBox(
                                height: media.height * 0.15,
                              ),
                              Container(
                                width: media.width,
                                height: 10.w,
                                alignment: Alignment.center,
                                child: Button(
                                  onTap: () async {
                                    if (otpNumber.length == 6) {
                                      timer.cancel();
                                      setState(() {
                                        _loading = true;
                                        _error = '';
                                      });
                                      //firebase code send false
                                      if (phoneAuthCheck == false) {
                                        var verify = true;

                                        if (verify == true) {
                                          var loginResponse =
                                              await AuthRepository()
                                                  .getLoginResponse(
                                                      'aeimesh@gmail.com',
                                                      '123456');
                                          if (loginResponse.success = true) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()));
                                          }
                                        }
                                      } else {
                                        // firebase code send true
                                        try {
                                          PhoneAuthCredential credential =
                                              PhoneAuthProvider.credential(
                                                  verificationId: verId,
                                                  smsCode: otpNumber);

                                          // Sign the user in (or link) with the credential
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);

                                          var verify = true;
                                          if (verify == true) {
                                            var loginResponse =
                                                await AuthRepository()
                                                    .getLoginResponse(
                                                        'aeimesh@gmail.com',
                                                        '123456');
                                            if (loginResponse.success = true) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home()));
                                            }
                                          }
                                        } on FirebaseAuthException catch (error) {
                                          if (error.code == 'Invalid OTP') {
                                            setState(() {
                                              otpController.clear();
                                              otpNumber = '';
                                              _error = 'Wrong OTP';
                                              _loading = false;
                                            });
                                          }
                                        }
                                      }
                                    } else if (phoneAuthCheck == true &&
                                        resendTime == 0 &&
                                        otpNumber.length != 6) {
                                      setState(() {
                                        setState(() {
                                          resendTime = 60;
                                        });
                                        timers();
                                      });
                                      phoneAuth('+91' + phnumber);
                                    }
                                  },
                                  borcolor:
                                      (resendTime != 0 && otpNumber.length != 6)
                                          ? underline
                                          : null,
                                  text: (otpNumber.length == 6)
                                      ? 'Verify'
                                      : (resendTime == 0)
                                          ? 'Resend'
                                          : 'Resend' +
                                              ' ' +
                                              resendTime.toString(),
                                  color:
                                      (resendTime != 0 && otpNumber.length != 6)
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
