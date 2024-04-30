// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quick_glimpse/presentation/screens/view_post/view_post.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class ExploreGridView extends StatelessWidget {
  ExploreGridView({required this.state, super.key});
  TimeLineLoadSuccessState state;
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        itemCount: state.timeline.length,
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        // ),

        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              customNavPush(
                  context,
                  ViewPostScreen(
                    isUser: false,
                    index: index,
                    timelinestate: state,
                  ));
            },
            child: GridTile(
                child: Image.network(
              state.timeline[index].image,
              fit: BoxFit.cover,
            )),
          );
        });
  }
}
