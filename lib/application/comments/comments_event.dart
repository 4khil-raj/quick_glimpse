part of 'comments_bloc.dart';

class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class CheckComments extends CommentsEvent {
  String image;
  CheckComments({required this.image});
}

class AddCommentEvent extends CommentsEvent {
  String image;
  String comment;
  AddCommentEvent({required this.comment, required this.image});
}
