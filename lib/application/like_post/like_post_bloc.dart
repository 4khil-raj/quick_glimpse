import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/infrastructure/repository/like_post/repo.dart';

part 'like_post_event.dart';
part 'like_post_state.dart';

class LikePostBloc extends Bloc<LikePostEvent, LikePostState> {
  LikePostBloc() : super(LikePostInitial()) {
    on<LikePostEvent>((event, emit) {
      emit(LikePostInitial());
    });
    on<CheckLike>((event, emit) async {
      final checkList = await LikePostRepo().likedOrNot(event.image);
      emit(LikedState(
        check: checkList,
      ));
    });
    on<LikeEvent>((event, emit) async {
      try {
        emit(LikeInit(image: event.imageUrl));
        await LikePostRepo().likePost(event.imageUrl);
        final likes = await LikePostRepo().getLikecount(event.imageUrl);
        final checkList = await LikePostRepo().likedOrNot(event.imageUrl);
        emit(LikedState(
            count: likes,
            liked: true,
            check: checkList,
            currentimg: event.imageUrl));
      } on FirebaseException catch (e) {
        emit(LikeErrorState(msg: e.message.toString()));
        print(e);
      }
    });
  }
}
