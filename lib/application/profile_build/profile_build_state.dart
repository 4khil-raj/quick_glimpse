part of 'profile_build_bloc.dart';

sealed class ProfileBuildState extends Equatable {
  const ProfileBuildState();

  @override
  List<Object> get props => [];
}

final class ProfileBuildInitial extends ProfileBuildState {}

class ProfileSaveToCredentialSuccess extends ProfileBuildState {}

class ProfileImageSuccess extends ProfileBuildState {
  XFile image;
  ProfileImageSuccess({required this.image});
}

class ProfileBuildError extends ProfileBuildState {
  String message;
  ProfileBuildError({required this.message});
}

class imagenullState extends ProfileBuildState {}
