part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
