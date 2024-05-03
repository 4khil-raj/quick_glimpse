// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/edit_delete/edit_delete_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/view_post/widgets/saved_view.dart';
import 'package:quick_glimpse/presentation/screens/view_post/widgets/screen.dart';

class ViewPostUsingProfile extends StatelessWidget {
  ViewPostUsingProfile(
      {required this.index,
      required this.saved,
      required this.isUser,
      required this.data,
      super.key});
  UserFoundSuccessState data;
  bool saved;
  int index;
  bool isUser;
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditDeleteBloc, EditDeleteState>(
        builder: (context, state) {
      if (state is EventSuccessState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<RandomProfileBloc>(context)
              .add(GetRandomUser(email: users!.uid!));
          Navigator.pop(context);
          BlocProvider.of<EditDeleteBloc>(context).add(const EditDeleteEvent());
        });
      } else if (state is LoadingState) {
        load = true;
      }
      return load
          ? const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : saved
              ? UsingProfileSavedScreen(
                  index: index, isUser: isUser, data: data)
              : UsingProfileScreen(
                  data: data,
                  index: index,
                  isUser: isUser,
                );
    });
  }
}
