// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';

class ExploreGridView extends StatelessWidget {
  ExploreGridView({required this.state, super.key});
  TimeLineLoadSuccessState state;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: state.timeline.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return GridTile(
              child: Image.network(
            state.timeline[index].image,
            fit: BoxFit.cover,
          ));
        });
  }
}
