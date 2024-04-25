// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_glimpse/domain/models/current_user/model.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

CurrentUserModel? users;

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(emittingIndex: 0)) {
    on<BottomNavCallEvent>((event, emit) async {
      int index = event.currentIndex;
      emit(BottomNavState(
        emittingIndex: index,
      ));
    });

    on<BottomImageEvent>(
      (event, emit) async {
        User? user;
        user = FirebaseAuth.instance.currentUser;
        final data = await FirebaseFirestore.instance
            .collection('Profile')
            .doc(user?.uid)
            .get();
        final theUser = data.data();
        users = CurrentUserModel(
            bio: theUser!['bio'],
            email: theUser['email'],
            name: theUser['name'],
            phone: theUser['phone'],
            followers: theUser['followers'],
            following: theUser['following'],
            post: theUser['post'],
            profile: theUser['profile_pic'],
            uid: theUser['uid']);

        emit(BottomImageState(profile: users!.profile));
      },
    );
  }
}
