part of 'follow_bloc.dart';

sealed class FollowEvent extends Equatable {
  const FollowEvent();

  @override
  List<Object> get props => [];
}

class FollowReqEvent extends FollowEvent {
  final String userUid;
  const FollowReqEvent({required this.userUid});
}

class CheckFollowEvent extends FollowEvent {}

class UnfollowEvent extends FollowEvent {
  const UnfollowEvent({required this.userUid});
  final String userUid;
}
