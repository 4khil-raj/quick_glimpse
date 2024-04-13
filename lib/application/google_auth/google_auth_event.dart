part of 'google_auth_bloc.dart';

sealed class GoogleAuthEvent extends Equatable {
  const GoogleAuthEvent();

  @override
  List<Object> get props => [];
}

class Googleinitial extends GoogleAuthEvent {}

final class GoogleSigninEvent extends GoogleAuthEvent {}
