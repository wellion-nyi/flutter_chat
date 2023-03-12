import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/screen/verfication_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppFirebase {
  Future<void> sendVerificationCode(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) {
          printInfo(info: "user verified");
        },
        verificationFailed: (FirebaseAuthException e) {
          printError(info: e.message!);
        },
        codeSent: (String verificationId, int? resendToken) async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("code", verificationId);
          Get.to(const VerficationScreen());
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> verifyOTP(String otp) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? verificationId = pref.getString("code");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
