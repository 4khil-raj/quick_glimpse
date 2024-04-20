import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quick_glimpse/infrastructure/repository/image_picker/image_picker.dart';

part 'profile_build_event.dart';
part 'profile_build_state.dart';

class ProfileBuildBloc extends Bloc<ProfileBuildEvent, ProfileBuildState> {
  ProfileBuildBloc() : super(ProfileBuildInitial()) {
    final user = FirebaseAuth.instance.currentUser;
    on<ProfileSaveToCredential>((event, emit) async {
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
            'profile_pic': event.image,
            'phone': user.phoneNumber,
            'bio': 'Edit the bio'
          });
          emit(ProfileSaveToCredentialSuccess());
        } else {
          emit(ProfileBuildError(message: '*Details are Required'));
        }
      } on FirebaseException catch (e) {
        emit(ProfileBuildError(message: e.message.toString()));
      }
    });

    on<ProfleImagePickerEvent>((event, emit) async {
      try {
        XFile? image = await ImageService().pickImageFromGallery();

        emit(ProfileImageSuccess(image: image!));
      } catch (e) {
        print(e);
      }
    });

    on<ChangeImageEvent>((event, emit) {
      emit(ProfileBuildInitial());
    });
  }
}
