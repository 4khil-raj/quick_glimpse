import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/domain/models/alerts/followers_model.dart';
import 'package:quick_glimpse/domain/models/alerts/like_comment.dart';
import 'package:quick_glimpse/infrastructure/repository/alerts/repo.dart';

part 'alerts_event.dart';
part 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  AlertsBloc() : super(AlertsInitial()) {
    on<AlertsEvent>((event, emit) {
      emit(AlertsInitial());
    });

    on<AlertRequstEvent>((event, emit) async {
      try {
        final followers = await AlertsRepo().getFollowers();
        final likecomments = await AlertsRepo().getLikeAndComment();
        emit(
            AlertsSuccessState(follower: followers, likecomment: likecomments));
      } catch (e) {
        print(e);
      }
    });
  }
}
