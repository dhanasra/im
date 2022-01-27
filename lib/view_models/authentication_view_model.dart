import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';

class AuthenticationViewModel{
  static late AuthenticationViewModel _instance;

  factory AuthenticationViewModel(App app) {
    _instance = AuthenticationViewModel._internal();
    return _instance;
  }

  AuthenticationViewModel._internal() {
    _init();
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  var verificationCode = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  void _init() {

  }

  void verifyPhoneNumber() async {

    await auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneNumberController.text}',
      timeout: const Duration(seconds: 30),
      codeSent: (String verificationId, int? resendToken) async {
        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: codeController.text,
        );
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId){  },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential)async  {
        final UserCredential authResult = await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {  },
    );
  }

  Future<void> signInWithPhoneNumber() async {
    try {
      print("one");
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: codeController.text,
      );
      await auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

}