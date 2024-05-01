import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
// import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
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
      emit(PostButtonPressState());
      try {
        var imagelink = await PhotoPostRepo().postPhoto(event.image);
        if (imagelink.isEmpty && event.caption.isEmpty) {
          emit(PostErrorState(messege: 'Fill all details'));
        } else {
          User? user = FirebaseAuth.instance.currentUser;
          FirebaseFirestore.instance.collection('post').doc().set({
            'image': imagelink,
            'uid': user!.uid,
            'name': users!.name,
            'userprofile': users!.profile,
            'caption': event.caption,
            'like': 0,
            'time': DateFormat('dd/MM/yy HH:mm a').format(DateTime.now())
          });
          emit(PostDoneState());
        }
      } on FirebaseException catch (e) {
        emit(PostErrorState(messege: e.message.toString()));
      }
    });
  }
}
