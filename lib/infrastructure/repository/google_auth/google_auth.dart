import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> signUpWithGoogle() async {
    User? user;
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final creds = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final usercredential = await _auth.signInWithCredential(creds);
        usercredential.user;
        print(usercredential.user!.displayName);
      } else {}
    } catch (e) {
      // throw Exception(e.toString());
      log('kopp');
      log(e.toString());
      log('kazhinj');
    }
    return user;
  }

  // Future<User?> signInWithGoogle({required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   print("==========================================");
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();

  //   if (googleSignInAccount != null) {
  //     print(
  //         "===================google sign n is not null=======================");

  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );

  //     try {
  //       print("===================entered in try=======================");

  //       final UserCredential userCredential =
  //           await auth.signInWithCredential(credential);

  //       user = userCredential.user;
  //       print(user!.displayName);
  //     } on FirebaseAuthException catch (e) {
  //       print(
  //           "===================entered in firebase catch=======================");

  //       if (e.code == 'account-exists-with-different-credential') {
  //         print(
  //             "=======================account-exists-with-different-credential===================");

  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //   AuthService.customSnackBar(
  //         //     content:
  //         //         'The account already exists with a different credential.',
  //         //   ),
  //         // );
  //       } else if (e.code == 'invalid-credential') {
  //         print("=======================invalid-credential===================");

  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //   AuthService.customSnackBar(
  //         //     content: 'Error occurred while accessing credentials. Try again.',
  //         //   ),
  //         // );
  //       }
  //     } catch (e) {
  //       print("=======================catch===================");

  //       // ScaffoldMessenger.of(context).showSnackBar(
  //       //   AuthService.customSnackBar(
  //       //     content: 'Error occurred using Google Sign-In. Try again.',
  //       //   ),
  //       // );
  //     }
  //     print("=======================error after ctch===================");

  //     return user;
  //   }
  //   print("=======================null===================");

  //   return null;
  // }
}
