part of 'add_post_bloc.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();

  @override
  List<Object> get props => [];
}

class AddPostInitial extends AddPostState {}

class ImageCameraSuccess extends AddPostState {
  XFile image;
  ImageCameraSuccess({required this.image});
}

class ImageGallerySuccess extends AddPostState {
  XFile image;
  ImageGallerySuccess({required this.image});
}

class PostErrorState extends AddPostState {
  String messege;
  PostErrorState({required this.messege});
}
