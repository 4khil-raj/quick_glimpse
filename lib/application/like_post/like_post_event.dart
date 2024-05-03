part of 'like_post_bloc.dart';

class LikePostEvent extends Equatable {
  const LikePostEvent();

  @override
  List<Object> get props => [];
}

class LikeEvent extends LikePostEvent {
  String imageUrl;
  LikeEvent({required this.imageUrl});
}

class CheckLike extends LikePostEvent {
  String image;
  CheckLike({required this.image});
}
