// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quick_glimpse/infrastructure/repository/forget_password/forget_passcoderepo.dart';
import 'package:quick_glimpse/infrastructure/repository/image_picker/image_picker.dart';

part 'profile_build_event.dart';
part 'profile_build_state.dart';

class ProfileBuildBloc extends Bloc<ProfileBuildEvent, ProfileBuildState> {
  ProfileBuildBloc() : super(ProfileBuildInitial()) {
    final user = FirebaseAuth.instance.currentUser;
    bool usercheck;
    on<ProfileSaveToCredential>((event, emit) async {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
      firebase_storage.UploadTask uploadTask = ref.putFile(File(event.image));
      await uploadTask;
      var newUrl = await ref.getDownloadURL();
      usercheck = await ForgetPasscodeRepo().checkEmailExists(event.email);
      if (usercheck == false) {
        try {
          if (event.email.isNotEmpty &&
              event.name.isNotEmpty &&
              event.image.isNotEmpty) {
            await FirebaseFirestore.instance
                .collection('Profile')
                .doc(user!.uid)
                .set({
              'email': event.email,
              'name': event.name,
              'profile_pic': newUrl,
              'phone': user.phoneNumber,
              'bio': 'Edit the bio',
              'following': 0,
              'followers': 0,
              'post': 0,
              'uid': user.uid
            });
            emit(ProfileSaveToCredentialSuccess());
          } else {
            emit(ProfileBuildError(message: '*Details are Required'));
          }
        } on FirebaseException catch (e) {
          emit(ProfileBuildError(message: e.message.toString()));
        }
      } else {
        emit(ProfileBuildError(message: 'The email Alredy Exist'));
      }
    });

    on<ProfleImagePickerEvent>((event, emit) async {
      try {
        XFile? image = await ImageService().pickImageFromGallery();

        if (image != null) {
          emit(ProfileImageSuccess(image: image));
        } else {
          emit(ProfileBuildError(message: 'Select Your Image!!!'));
        }
      } on FirebaseException catch (e) {
        emit(ProfileBuildError(message: e.message.toString()));
      }
    });

    on<ChangeImageEvent>((event, emit) {
      emit(ProfileBuildInitial());
    });
  }
}
