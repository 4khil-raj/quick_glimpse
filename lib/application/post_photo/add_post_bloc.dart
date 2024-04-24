import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_glimpse/infrastructure/repository/image_picker/image_picker.dart';
import 'package:quick_glimpse/infrastructure/repository/post_photo/post.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  AddPostBloc() : super(AddPostInitial()) {
    on<ChangeImageEvent>((event, emit) {
      emit(AddPostInitial());
    });

    on<ImagePickGalleryEvent>((event, emit) async {
      try {
        XFile? image = await ImageService().pickImageFromGallery();

        if (image != null) {
          emit(ImageGallerySuccess(image: image));
        } else {
          emit(PostErrorState(messege: 'Select Your Image!!!'));
        }
      } on FirebaseException catch (e) {
        emit(PostErrorState(messege: e.message.toString()));
      }
    });
    on<ImagePickCameraEvent>((event, emit) async {
      try {
        XFile? image = await ImageService().pickImageFromCamera();

        if (image != null) {
          emit(ImageCameraSuccess(image: image));
        } else {
          emit(PostErrorState(messege: 'Select Your Image!!!'));
        }
      } on FirebaseException catch (e) {
        emit(PostErrorState(messege: e.message.toString()));
      }
    });

    on<NewPostEvent>((event, emit) async {
      try {
        var imagelink = await PhotoPostRepo().postPhoto(event.image);
        User? user = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance.collection('post').doc('allpost').set({
          'image': imagelink,
          'user': user,
          'caption': event.caption,
          'like': '0'
        });
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
