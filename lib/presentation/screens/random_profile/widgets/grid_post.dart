// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';

class RandomPostGridView extends StatelessWidget {
  RandomPostGridView({required this.state, super.key});
  UserFoundSuccessState state;
  @override
  Widget build(BuildContext context) {
    return state.post.isNotEmpty
        ? Expanded(
            child: GridView.builder(
                itemCount: state.post.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 5.0, // Spacing between columns
                  mainAxisSpacing: 5.0, // Spacing between rows
                ),
                itemBuilder: (context, index) {
                  return GridTile(
                      child: Image.network(
                    state.post[index].image,
                    fit: BoxFit.cover,
                  ));
                }))
        : const Center(child: Text('No post Found!'));
  }
}
