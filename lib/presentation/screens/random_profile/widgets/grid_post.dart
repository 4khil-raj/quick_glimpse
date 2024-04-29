// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/view_post/view_post.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

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
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        // customNavPush(
                        //     context,
                        //     ViewPostScreen(
                        //       state: state,
                        //     ));
                      });
                    },
                    child: GridTile(
                        child: Image.network(
                      state.post[index].image,
                      fit: BoxFit.cover,
                    )),
                  );
                }))
        : const Center(child: Text('No post Found!'));
  }
}
