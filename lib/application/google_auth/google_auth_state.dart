part of 'google_auth_bloc.dart';

sealed class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleAuthLoading extends GoogleAuthState {}

final class GoogleAuthError extends GoogleAuthState {
  String? message;
  GoogleAuthError({required this.message});
}

final class GoogleAuthenticated extends GoogleAuthState {}
