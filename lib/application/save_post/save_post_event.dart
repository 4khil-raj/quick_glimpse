part of 'save_post_bloc.dart';

class SavePostEvent extends Equatable {
  const SavePostEvent();

  @override
  List<Object> get props => [];
}

class SavePostRequestEvent extends SavePostEvent {
  const SavePostRequestEvent({required this.value, required this.index});
  final TimeLineLoadSuccessState value;
  final int index;
}

class SaveCheckingEvent extends SavePostEvent {}

class RemoveSavedPostEvent extends SavePostEvent {
  final TimeLineLoadSuccessState state;
  final int index;
  const RemoveSavedPostEvent({required this.state, required this.index});
}

class RemoveSavedPostUsingProfile extends SavePostEvent {
  const RemoveSavedPostUsingProfile({required this.image, required this.index});
  final String image;
  final int index;
}
