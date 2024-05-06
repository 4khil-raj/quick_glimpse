part of 'follow_bloc.dart';

sealed class FollowState extends Equatable {
  const FollowState();

  @override
  List<Object> get props => [];
}

final class FollowInitial extends FollowState {}

class FollowSuccessState extends FollowState {
  final List list;
  final int? count;
  const FollowSuccessState({this.count, required this.list});
}

class FollowErrorState extends FollowState {
  final String msg;
  const FollowErrorState({required this.msg});
}

class IncreaseState extends FollowState {}

class DecreaseState extends FollowState {}
