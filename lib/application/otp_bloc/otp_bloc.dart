import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_glimpse/infrastructure/repository/otp_auth/otp.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  String loginResult = '';
  OtpAuthModel authModel = OtpAuthModel();

  UserCredential? userCredential;
  OtpBloc() : super(OtpInitialState()) {
    on<SendOtpPhoneEvent>((event, emit) async {
      emit(OtpLoadingScreen());
      try {
        if (event.phone.isNotEmpty) {
          await authModel.loginWithPhone(
              phoneNumber: event.phone,
              verificationCompleted: (PhoneAuthCredential credential) {
                add(OnOtpAuthenticatedEvent(credential: credential));
              },
              verificationFailed: (FirebaseAuthException e) {
                add(OnOtpErrorEvent(msg: e.toString()));
              },
              codeSent: (String verificationId, int? refreshToken) {
                add(OnphoneOtpSend(
                    token: refreshToken, verifiactionId: verificationId));
              },
              codeAutoRetrievalTimeout: (String verifiacationId) {});
        } else {
          emit(OtpScreenErrorState(error: 'Enter Your Phone Number'));
        }
      } catch (e) {
        emit(OtpScreenErrorState(error: e.toString()));
      }
    });

    on<OnphoneOtpSend>((event, emit) {
      emit(PhoneAuthCodeSentSuccess(verificationId: event.verifiactionId));
    });

    on<VerifySentOtp>((event, emit) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId, smsCode: event.otpCode);
        add(OnOtpAuthenticatedEvent(credential: credential));
      } catch (e) {
        emit(OtpScreenErrorState(error: e.toString()));
      }
    });

    on<OnOtpErrorEvent>((event, emit) {
      emit(OtpScreenErrorState(error: event.msg));
    });

    on<OnOtpAuthenticatedEvent>((event, emit) async {
      try {
        await authModel.authentication
            .signInWithCredential(event.credential)
            .then((value) {
          emit(SignUpScreenOtpSuccessState());
          emit(OtpLoadedState());
        });
      } catch (e) {
        emit(OtpScreenErrorState(error: e.toString()));
      }
    });

    on<OtpinitialEvent>((event, emit) {
      emit(OtpInitialState());
    });
  }
}
