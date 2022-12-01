import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool internet = true;

String userUid = '';
var verId = '';
int? resendTokenId;
bool phoneAuthCheck = false;
dynamic credentials;

phoneAuth(String phone) async {
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        credentials = credential;
      },
      forceResendingToken: resendTokenId,
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          debugPrint('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verId = verificationId;
        resendTokenId = resendToken;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } catch (e) {
    if (e is SocketException) {
      internet = false;
    }
  }
}

class ValueNotifying {
  ValueNotifier value = ValueNotifier(0);

  void incrementNotifier() {
    value.value++;
  }
}

ValueNotifying valueNotifier = ValueNotifying();

class ValueNotifyingHome {
  ValueNotifier value = ValueNotifier(0);

  void incrementNotifier() {
    value.value++;
  }
}

ValueNotifying valueNotifierHome = ValueNotifying();

internetTrue() {
  internet = true;
  valueNotifierHome.incrementNotifier();
}
