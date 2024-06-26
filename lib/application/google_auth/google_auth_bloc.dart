import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/infrastructure/repository/google_auth/google_auth.dart';

part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  GoogleAuthBloc(this._authRepo) : super(GoogleAuthInitial()) {
    on<GoogleSigninEvent>(_signinWithGoogle);
    on<Googleinitial>(
      (event, emit) {
        emit(GoogleAuthInitial());
      },
    );
  }
  final AuthRepository _authRepo;
  Future<void> _signinWithGoogle(
      GoogleSigninEvent event, Emitter<GoogleAuthState> emit) async {
    try {
      emit(GoogleAuthLoading());
      final user = await _authRepo.signUpWithGoogle();
      if (user == null) {
        emit(GoogleAuthError(message: 'Can\'t find Your GoogleAccount'));
      } else {
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'name': user.displayName,
          // 'profilepicture': user.photoURL,
        });
        FirebaseFirestore.instance.collection('Profile').doc(user.uid).set({
          'email': user.email,
          'name': user.displayName,
          'profile_pic': user.photoURL,
          'phone': user.phoneNumber,
          'bio': 'Edit the bio',
          'uid': user.uid,
          'followers': 0,
          'following': 0,
          'post': 0
        });

        emit(GoogleAuthenticated());
        await Future.delayed(const Duration(seconds: 2), () {
          emit(GoogleAuthInitial());
        });
      }
    } catch (e) {
      emit(GoogleAuthError(message: e.toString()));
    }
  }
}
