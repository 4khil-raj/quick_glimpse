part of 'profile_build_bloc.dart';

sealed class ProfileBuildEvent extends Equatable {
  const ProfileBuildEvent();

  @override
  List<Object> get props => [];
}

class ChangeImageEvent extends ProfileBuildEvent {}

class ProfileSaveToCredential extends ProfileBuildEvent {
  String image;
  String name;
  String email;
  ProfileSaveToCredential(
      {required this.email, required this.name, required this.image});
}

class ProfleImagePickerEvent extends ProfileBuildEvent {}

class ImageNotNull extends ProfileBuildEvent {}
