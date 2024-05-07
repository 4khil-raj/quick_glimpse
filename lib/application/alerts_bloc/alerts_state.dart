part of 'alerts_bloc.dart';

sealed class AlertsState extends Equatable {
  const AlertsState();

  @override
  List<Object> get props => [];
}

final class AlertsInitial extends AlertsState {}

class AlertsSuccessState extends AlertsState {
  final List<FollowersModel> follower;
  final List<LikeCommentModel> likecomment;

  const AlertsSuccessState({required this.follower, required this.likecomment});
}
