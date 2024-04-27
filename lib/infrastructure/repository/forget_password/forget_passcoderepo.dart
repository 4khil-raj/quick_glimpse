import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPasscodeRepo {
  final auth = FirebaseAuth.instance;
  Future<void> forgetpasscode(context, forgetEmailController) async {
    bool emailexist = true;
    emailexist = await checkEmailExists(forgetEmailController);
    if (emailexist) {
      auth.sendPasswordResetEmail(email: forgetEmailController).then((value) {
        Fluttertoast.showToast(
            msg:
                "We have sent you email to recover password,please check email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: const Color.fromARGB(255, 54, 158, 244),
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Email is not in out database ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<bool> checkEmailExists(forgetEmailController) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Profile')
          .where('email', isEqualTo: forgetEmailController)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
