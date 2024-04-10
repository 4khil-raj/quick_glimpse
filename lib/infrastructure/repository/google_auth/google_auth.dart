import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> signUpWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final creds = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final usercredential = await _auth.signInWithCredential(creds);
        usercredential.user;
      }
    } catch (e) {
      // throw Exception(e.toString());
      log('kopp');
      log(e.toString());
      log('kazhinj');
    }
  }
}
