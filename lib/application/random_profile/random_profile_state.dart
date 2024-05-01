part of 'random_profile_bloc.dart';

sealed class RandomProfileState extends Equatable {
  const RandomProfileState();

  @override
  List<Object> get props => [];
}

final class RandomProfileInitial extends RandomProfileState {}

class UserFoundSuccessState extends RandomProfileState {
  UserFoundSuccessState({required this.user, required this.post, this.saved});
  RandomUserModel user;
  List<TimelineModel> post;
  List<TimelineModel>? saved;
}

class RandomUserErrorState extends RandomProfileState {
  String msg;
  RandomUserErrorState({required this.msg});
}
