part of 'add_post_bloc.dart';

sealed class AddPostEvent extends Equatable {
  const AddPostEvent();

  @override
  List<Object> get props => [];
}

class ImagePickCameraEvent extends AddPostEvent {}

class ImagePickGalleryEvent extends AddPostEvent {}

class ChangeImageEvent extends AddPostEvent {}

class NewPostEvent extends AddPostEvent {
  String image;
  String caption;
  String like;
  NewPostEvent(
      {required this.caption, required this.image, required this.like});
}
