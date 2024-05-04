import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/domain/models/comments/model.dart';
import 'package:quick_glimpse/infrastructure/repository/comments/repo.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsEvent>((event, emit) {
      emit(CommentsInitial());
    });

    on<CheckComments>((event, emit) async {
      try {
        final commentList = await CommentsRepo().getComments(event.image);
        emit(CommentsFound(comments: commentList));
      } on FirebaseException catch (e) {
        emit(CommentErrorState(msg: e.message.toString()));
      }
    });

    on<AddCommentEvent>((event, emit) async {
      try {
        await CommentsRepo().addComments(event.image, event.comment);
        final commentList = await CommentsRepo().getComments(event.image);
        emit(CommentsFound(comments: commentList));
      } on FirebaseException catch (e) {
        emit(CommentErrorState(msg: e.message.toString()));
      }
    });
    on<DeleteCommentEvent>((event, emit) async {
      try {
        await CommentsRepo().deleteComment(event.commentId);
        add(CheckComments(image: event.image));
      } on FirebaseException catch (e) {
        emit(CommentErrorState(msg: e.message.toString()));
      }
    });
  }
}
