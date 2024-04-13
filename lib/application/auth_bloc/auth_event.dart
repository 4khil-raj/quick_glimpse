part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckLoginStatusEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  final String passcode;
  LoginEvent({required this.email, required this.passcode});
}

class SignUpEvent extends AuthEvent {
  final UserModel user;
  SignUpEvent({required this.user});
}

class SignoutEvent extends AuthEvent {}

class LoggingInitialEvent extends AuthEvent {}
