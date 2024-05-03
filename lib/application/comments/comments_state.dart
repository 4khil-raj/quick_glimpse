part of 'comments_bloc.dart';

class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {
  List<CommentModel>? comments;
  CommentsInitial({this.comments});
}

class CommentsSuccessState extends CommentsState {
  List<CommentModel> comments;
  CommentsSuccessState({required this.comments});
}

class CommentErrorState extends CommentsState {
  String msg;
  CommentErrorState({required this.msg});
}

class CommentsFound extends CommentsState {
  List<CommentModel> comments;
  CommentsFound({required this.comments});
}
