import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpAuthModel {
  FirebaseAuth authentication = FirebaseAuth.instance;
  User? firebaseUser;
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> loginWithPhone(
      {required String phoneNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    await authentication.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<bool> checkUser(phonenum) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Profile')
          .where('phone', isEqualTo: phonenum)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
