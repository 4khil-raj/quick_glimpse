// ignore_for_file: avoid_print

import 'dart:developer';

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
  OtpBloc() : super(OtpInitial()) {
    on<SendOtpPhoneEvent>((event, emit) async {
      emit(OtpLoadingScreen());
      print('entered in event');
      print(event.phone);

      try {
        print('entered in try');
        print(event.phone);

        await authModel.loginWithPhone(
            phoneNumber: event.phone,
            verificationCompleted: (PhoneAuthCredential credential) {
              print('verification completed');

              add(OnOtpAuthenticatedEvent(credential: credential));
              print(event.phone);
            },
            verificationFailed: (FirebaseAuthException e) {
              print('verification failed');
              print(event.phone);

              add(OnOtpErrorEvent(msg: e.toString()));
            },
            codeSent: (String verificationId, int? refreshToken) {
              print('enterd in code sent');
              print(event.phone);
              print(verificationId);
              print(refreshToken);
              add(OnphoneOtpSend(
                  token: refreshToken, verifiactionId: verificationId));
            },
            codeAutoRetrievalTimeout: (String verifiacationId) {});
      } catch (e) {
        print('entered in catch');
        print(event.phone);

        emit(OtpScreenErrorState(error: e.toString()));
      }
      print('exit');
    });

    on<OnphoneOtpSend>((event, emit) {
      emit(PhoneAuthCodeSentSuccess(verificationId: event.verifiactionId));
    });

    on<VerifySentOtp>((event, emit) {
      print(
          '============================================sdfsdhfksjdfhksdjfhs=================================================================================================================================================');
      try {
        log('verification started================================================');
        print('iam not feeling wellll');
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId, smsCode: event.otpCode);
        print('ippokittym');
        // log('tessssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
        add(OnOtpAuthenticatedEvent(credential: credential));
        print('kitty');
      } catch (e) {
        emit(OtpScreenErrorState(error: e.toString()));
      }
    });

    on<OnOtpErrorEvent>((event, emit) {
      emit(OtpScreenErrorState(error: event.msg));
    });

    on<OnOtpAuthenticatedEvent>((event, emit) async {
      print('ist done');
      try {
        await authModel.authentication
            .signInWithCredential(event.credential)
            .then((value) {
          emit(SignUpScreenOtpSuccessState());
          emit(OtpLoadedState());
          print('emitted successfull');
        });
      } catch (e) {
        emit(OtpScreenErrorState(error: e.toString()));
      }
    });
  }
}
