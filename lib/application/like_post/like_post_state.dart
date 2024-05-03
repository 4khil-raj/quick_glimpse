part of 'like_post_bloc.dart';

sealed class LikePostState extends Equatable {
  const LikePostState();

  @override
  List<Object> get props => [];
}

final class LikePostInitial extends LikePostState {}

class LikedState extends LikePostState {
  int? count;
  bool? liked;
  List check;
  String? currentimg;
  LikedState({this.count, this.liked, required this.check, this.currentimg});
}

class LikeErrorState extends LikePostState {
  String msg;
  LikeErrorState({required this.msg});
}

class LikeInit extends LikePostState {
  String image;
  LikeInit({required this.image});
}
