part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignupRequsted extends AuthEvent {
  final String email;
  final String password;
  SignupRequsted(this.email, this.password);
}
