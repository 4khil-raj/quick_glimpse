import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/domain/models/timeline/model.dart';
import 'package:quick_glimpse/infrastructure/repository/timeline/repo.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc() : super(TimelineInitial()) {
    // on<TimelineEvent>((event, emit) async {
    //   emit(TimelineInitial());
    //   await Future.delayed(const Duration(seconds: 1));
    //   add(TimelineShowEvent());
    // });
    on<TimelineShowEvent>((event, emit) async {
      emit(TimelineInitial());
      await Future.delayed(Duration(seconds: 1));
      try {
        TimelineRepo rep = TimelineRepo();
        final feeds = await rep.getTimeline();
        if (feeds.isEmpty) {
          emit(TimelineErrorState(msg: 'Can\'t load now'));
        } else {
          emit(TimeLineLoadSuccessState(timeline: feeds));
        }
      } on FirebaseException catch (e) {
        emit(TimelineErrorState(msg: e.message.toString()));
      }
    });
  }
}
