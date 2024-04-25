part of 'timeline_bloc.dart';

sealed class TimelineState extends Equatable {
  const TimelineState();

  @override
  List<Object> get props => [];
}

class TimelineInitial extends TimelineState {}

class TimeLineLoadSuccessState extends TimelineState {
  List<TimelineModel> timeline;
  TimeLineLoadSuccessState({required this.timeline});
}

class TimelineErrorState extends TimelineState {
  String msg;
  TimelineErrorState({required this.msg});
}
