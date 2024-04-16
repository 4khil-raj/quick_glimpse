part of 'otp_bloc.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitialState extends OtpState {}

class OtpLoadingScreen extends OtpState {}

class OtpLoadedState extends OtpState {}

class OtpScreenErrorState extends OtpState {
  String error;
  OtpScreenErrorState({required this.error});
}

class PhoneAuthCodeSentSuccess extends OtpState {
  final String verificationId;

  const PhoneAuthCodeSentSuccess({required this.verificationId});
}

class SignUpScreenOtpSuccessState extends OtpState {}

class Loadinghome extends OtpState {}

class Otploadingstate extends OtpState {}
