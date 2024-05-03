import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/like_post/like_post_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';

class LikeButtons extends StatelessWidget {
  LikeButtons({required this.data, required this.index, super.key});
  TimeLineLoadSuccessState data;
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikePostBloc, LikePostState>(
      builder: (context, state) {
        if (state is LikeInit) {
          if (state.image == data.timeline[index].image) {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 33.4,
                  child: Text(
                    (data.timeline[index].like + 1).toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
        }

        if (state is LikedState) {
          final image = state.check
              .where((element) => element == data.timeline[index].image);
          if (image.isNotEmpty && state.check.contains(users!.uid)) {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                Positioned(
                  // bottom: -15,
                  left: 20,
                  top: 33.4,
                  // right: 15,
                  child: Text(
                    (data.timeline[index].like + 1).toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return Stack(
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<LikePostBloc>(context)
                    .add(LikeEvent(imageUrl: data.timeline[index].image));
              },
              icon: const Icon(
                Icons.favorite_border_rounded,
                size: 30,
              ),
            ),
            Positioned(
              // bottom: -15,
              left: 20,
              top: 33.4,
              // right: 15,
              child: Text(
                data.timeline[index].like.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
