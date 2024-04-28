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
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 5.0, // Spacing between columns
          mainAxisSpacing: 5.0, // Spacing between rows
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
