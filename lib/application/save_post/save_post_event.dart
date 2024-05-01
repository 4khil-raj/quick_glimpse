part of 'save_post_bloc.dart';

class SavePostEvent extends Equatable {
  const SavePostEvent();

  @override
  List<Object> get props => [];
}

class SavePostRequestEvent extends SavePostEvent {
  SavePostRequestEvent({required this.value, required this.index});
  TimeLineLoadSuccessState value;
  int index;
}

class SaveCheckingEvent extends SavePostEvent {}

class RemoveSavedPostEvent extends SavePostEvent {
  TimeLineLoadSuccessState state;
  int index;
  RemoveSavedPostEvent({required this.state, required this.index});
}
