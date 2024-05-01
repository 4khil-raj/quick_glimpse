// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/save_post/save_post_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/snackbar.dart';

class SaveButtonTimeline extends StatelessWidget {
  SaveButtonTimeline({required this.value, super.key, required this.index});
//enthelum error varuvanel TimeLineLoadSuccessState dynamic matt
  TimeLineLoadSuccessState value;
  int index;
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavePostBloc, SavePostState>(builder: (context, state) {
      if (state is SaveSuccessState) {
        if (state.done.contains(users!.uid) &&
            state.done.contains(value.timeline[index].image)) {
          return IconButton(
              onPressed: () {
                BlocProvider.of<SavePostBloc>(context)
                    .add(RemoveSavedPostEvent(state: value, index: index));
                homeSnackbar(context, 'Removed', Colors.red);
              },
              icon: Icon(Icons.bookmark));
        }
      }
      return IconButton(
          onPressed: () {
            BlocProvider.of<SavePostBloc>(context)
                .add(SavePostRequestEvent(value: value, index: index));
            homeSnackbar(context, 'Saving...', Colors.green);
          },
          icon: Icon(Icons.bookmark_outline));
    });
  }
}
