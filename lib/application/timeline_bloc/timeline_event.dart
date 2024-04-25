part of 'timeline_bloc.dart';

sealed class TimelineEvent extends Equatable {
  const TimelineEvent();

  @override
  List<Object> get props => [];
}

class TimelineShowEvent extends TimelineEvent {}
