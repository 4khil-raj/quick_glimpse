part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class SendOtpPhoneEvent extends OtpEvent {
  final String phone;
  const SendOtpPhoneEvent({required this.phone});
}

class OnphoneOtpSend extends OtpEvent {
  final String verifiactionId;
  final int? token;

  const OnphoneOtpSend({required this.token, required this.verifiactionId});
}

class OtpinitialEvent extends OtpEvent {}

class VerifySentOtp extends OtpEvent {
  final String otpCode;
  final String verificationId;
  const VerifySentOtp({required this.otpCode, required this.verificationId});
}

class OnOtpErrorEvent extends OtpEvent {
  final String msg;
  const OnOtpErrorEvent({required this.msg});
}

class OnOtpAuthenticatedEvent extends OtpEvent {
  final AuthCredential credential;

  const OnOtpAuthenticatedEvent({required this.credential});
}
