part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  User? user;
  Authenticated({this.user});
}

class SignUpAuthSuccessState extends AuthState {
  User? user;
  SignUpAuthSuccessState({required this.user});
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  String? message;

  AuthError({required this.message});
}

class AuthInitalState extends AuthState {}
