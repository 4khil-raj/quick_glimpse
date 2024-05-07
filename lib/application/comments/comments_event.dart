// ignore_for_file: must_be_immutable

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
  String uid;
  AddCommentEvent(
      {required this.comment, required this.image, required this.uid});
}

class DeleteCommentEvent extends CommentsEvent {
  String commentId;
  String image;
  DeleteCommentEvent({required this.image, required this.commentId});
}
