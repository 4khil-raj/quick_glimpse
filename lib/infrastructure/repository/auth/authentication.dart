import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<void> signUp({required String email, required String password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-passord') {
        throw Exception('this passcode is too week');
      } else if (e.code == 'email-alredy-in-use') {
        throw Exception('The account already exists for that email');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
