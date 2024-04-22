import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_glimpse/infrastructure/repository/otp_auth/otp.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  String loginResult = '';
  OtpAuthModel authModel = OtpAuthModel();
  bool? usercheck;
  UserCredential? userCredential;
  OtpBloc() : super(OtpInitialState()) {
    on<SendOtpPhoneEvent>((event, emit) async {
      usercheck = await authModel.checkUser(event.phone);
      emit(OtpLoadingScreen());
      try {
        if (event.phone.isNotEmpty) {
          await authModel.loginWithPhone(
              phoneNumber: event.phone,
              verificationCompleted: (PhoneAuthCredential credential) {
                add(OnOtpAuthenticatedEvent(credential: credential));
              },
              verificationFailed: (FirebaseAuthException e) {
                add(OnOtpErrorEvent(msg: e.message.toString()));
              },
              codeSent: (String verificationId, int? refreshToken) {
                add(OnphoneOtpSend(
                    token: refreshToken, verifiactionId: verificationId));
              },
              codeAutoRetrievalTimeout: (String verifiacationId) {});
        } else {
          emit(OtpScreenErrorState(error: 'Enter Your Phone Number'));
        }
      } on FirebaseAuthException catch (e) {
        emit(OtpScreenErrorState(error: e.message.toString()));
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
      } on FirebaseAuthException catch (e) {
        emit(OtpScreenErrorState(error: e.message.toString()));
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

          if (usercheck == true) {
            emit(OtpDonegotoHome());
          } else {
            emit(OtpLoadedState());
          }
        });
      } on FirebaseAuthException catch (e) {
        emit(OtpScreenErrorState(error: e.message.toString()));
      }
    });

    on<OtpinitialEvent>((event, emit) {
      emit(OtpInitialState());
    });
  }
}
