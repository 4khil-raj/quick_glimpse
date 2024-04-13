import 'package:bloc/bloc.dart';
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
      // print('try===========================================');
      final user = await _authRepo.signUpWithGoogle();

      // print('await comp=================================================');
      if (user == null) {
        // print(
        // 'usernulll============================================================');
        emit(GoogleAuthError(message: 'Can\'t find Your GoogleAccont'));
      } else {
        emit(GoogleAuthenticated());
      }
    } catch (e) {
      emit(GoogleAuthError(message: e.toString()));
    }
  }
}