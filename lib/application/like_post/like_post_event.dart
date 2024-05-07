part of 'like_post_bloc.dart';

class LikePostEvent extends Equatable {
  const LikePostEvent();

  @override
  List<Object> get props => [];
}

class LikeEvent extends LikePostEvent {
  String useruid;
  String imageUrl;
  LikeEvent({required this.imageUrl, required this.useruid});
}

class CheckLike extends LikePostEvent {
  String? image;
  CheckLike({this.image});
}

class UnlikeEvent extends LikePostEvent {
  String image;
  UnlikeEvent({required this.image});
}
