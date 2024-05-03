// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/view_post/widgets/use_explore.dart';
import 'package:quick_glimpse/presentation/screens/view_post/widgets/use_profile.dart';

class ViewPostScreen extends StatelessWidget {
  ViewPostScreen(
      {this.timelinestate,
      required this.isUser,
      this.state,
      required this.saved,
      super.key,
      required this.index});
  bool saved;
  UserFoundSuccessState? state;
  TimeLineLoadSuccessState? timelinestate;
  int index;
  bool isUser = false;
  @override
  Widget build(BuildContext context) {
    return state == null
        ? ViewPostUsingExplorer(
            index: index, isUser: isUser, state: timelinestate!)
        : ViewPostUsingProfile(
            saved: saved, index: index, isUser: isUser, data: state!);
  }
}
