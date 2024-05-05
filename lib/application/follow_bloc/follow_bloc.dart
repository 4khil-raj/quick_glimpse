import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/infrastructure/repository/follow/repo.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  FollowBloc() : super(FollowInitial()) {
    // on<FollowEvent>((event, emit) {
    //   emit(FollowInitial());
    // });
    on<FollowReqEvent>((event, emit) async {
      try {
        await FollowRepo().follow(event.userUid);
        final list = await FollowRepo().checkFollow();
        emit(FollowSuccessState(list: list));
      } on FirebaseException catch (e) {
        emit(FollowErrorState(msg: e.message.toString()));
      }
    });

    on<CheckFollowEvent>((event, emit) async {
      final list = await FollowRepo().checkFollow();
      emit(FollowSuccessState(list: list));
    });

    on<UnfollowEvent>((event, emit) async {
      await FollowRepo().unFollow(event.userUid);
      final list = await FollowRepo().checkFollow();
      emit(FollowSuccessState(list: list));
    });
  }
}
