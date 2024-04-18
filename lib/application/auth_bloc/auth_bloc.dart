import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_glimpse/domain/models/auth_model/model.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    // on<LoginEvent>(loginCheck);
    on<LoggingInitialEvent>((event, emit) {
      emit(AuthInitalState());
    });

    // --------->Checking user is signin or not<----------------//

    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;
      try {
        await Future.delayed(const Duration(seconds: 3), () {
          user = _auth.currentUser;
        });

        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

//------------------------->Sign up<-----------------------------//

    on<SignUpEvent>((event, emit) async {
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: event.user.email.toString(),
            password: event.user.password.toString());
        phoneController.clear();
        emailContoller.clear();
        usernameController.clear();
        createPasscodeController.clear();
        conformPasscodeContoller.clear();
        emit(AuthLoading());
        final user = userCredential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email': user.email,
            'passcode': event.user.password,
            'name': event.user.name,
            'phone': event.user.phone,
            'uid': user.uid
          });

          emit(Authenticated(user: user));
        } else {
          emit(AuthError(message: 'Fill All details'));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    //------------>SignOut<--------------//

    on<SignoutEvent>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
//---------->Login<--------------//

    on<LoginEvent>((event, emit) async {
      //
      try {
        if (event.email.isNotEmpty && event.passcode.isNotEmpty) {
          emit(AuthLoading());
          UserCredential? userCredential =
              await _auth.signInWithEmailAndPassword(
                  email: event.email, password: event.passcode);

          final user = userCredential.user;
          if (user != null) {
            emit(Authenticated(user: user));
          } else {
            emit(UnAuthenticated());
          }
        } else {
          emit(AuthError(message: 'Enter Valid info!!!'));
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthError(message: e.message.toString()));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}

//     on<LoginEvent>((event, emit) async {
//       try {
//         if (event.email.isNotEmpty && event.passcode.isNotEmpty) {
//           UserCredential userCredential =
//               await _auth.signInWithEmailAndPassword(
//                   email: event.email, password: event.passcode);

//           final user = userCredential.user;
//           if (user != null) {
//             emit(Authenticated(user: user));
//           } else {
//             emit(UnAuthenticated());
//           }
//         } else {
//           emit(AuthError(message: 'Please enter valid email and password.'));
//         }
//       } on FirebaseAuthException catch (e) {
//         // Handle specific authentication errors
//         if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//           emit(AuthError(
//               message: 'Invalid email or password. Please try again.'));
//         } else {
//           // Handle other FirebaseAuth exceptions
//           emit(AuthError(message: 'Authentication failed: ${e.message}'));
//         }
//       } catch (e) {
//         // Handle other exceptions
//         emit(AuthError(message: 'An unexpected error occurred.'));
//       }
//     });
//   }
// }

//     FutureOr<void> loginCheck(LoginEvent event, Emitter<AuthState> emit) async {
//       try {
//         if (event.email.isNotEmpty && event.passcode.isNotEmpty) {
//           emit(AuthLoading());
//           UserCredential? userCredential =
//               await _auth.signInWithEmailAndPassword(
//                   email: event.email, password: event.passcode);

//           final user = userCredential.user;
//           if (user != null) {
//             emit(Authenticated(user: user));
//           } else {
//             emit(UnAuthenticated());
//           }
//         } else {
//           emit(AuthError(message: 'Enter Valid info!!!'));
//         }
//       } on FirebaseAuthException catch (e) {
//         emit(AuthError(message: e.message.toString()));
//       } catch (e) {
//         emit(AuthError(message: e.toString()));
//       }
//     }
//   }
// }
