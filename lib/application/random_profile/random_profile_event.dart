part of 'random_profile_bloc.dart';

class RandomProfileEvent extends Equatable {
  const RandomProfileEvent();

  @override
  List<Object> get props => [];
}

class RandomProfileInitialEvent extends RandomProfileEvent {}

class GetRandomUser extends RandomProfileEvent {
  GetRandomUser({
    required this.email,
  });
  String email;
}
