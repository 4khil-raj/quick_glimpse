import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/domain/models/random_user/model.dart';
import 'package:quick_glimpse/domain/models/timeline/model.dart';
import 'package:quick_glimpse/infrastructure/repository/random_user/repo.dart';
part 'random_profile_event.dart';
part 'random_profile_state.dart';

class RandomProfileBloc extends Bloc<RandomProfileEvent, RandomProfileState> {
  RandomProfileBloc() : super(RandomProfileInitial()) {
    on<RandomProfileEvent>((event, emit) {
      emit(RandomProfileInitial());
    });
    on<GetRandomUser>((event, emit) async {
      try {
        // await Future.delayed(const Duration(seconds: 2));
        final user = await RandomUserRepo().findRandomUser(event.email);
        final posts = await RandomUserRepo().getRandomUserPosts(event.email);
        if (user.isEmpty) {
          emit(RandomUserErrorState(msg: 'some Error occuar'));
        } else {
          emit(UserFoundSuccessState(user: user[0], post: posts));
        }
      } on FirebaseException catch (e) {
        RandomUserErrorState(msg: e.message.toString());
      }
    });
  }
}
