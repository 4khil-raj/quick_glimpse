// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/comments/comments_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/comments.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/like_buttons.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/save_buttons.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/list_tile.dart';

class TimelineBuilder extends StatelessWidget {
  const TimelineBuilder({super.key, required this.state});
  final TimeLineLoadSuccessState state;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RandomProfileBloc>(context).add(const RandomProfileEvent());
    return SizedBox(
        height: MediaQuery.of(context).size.height - 180,
        child: ListView.builder(
            itemCount: state.timeline.length,
            itemBuilder: (context, index) {
              return Column(children: [
                HomeListTile(value: state, index: index),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 8, bottom: 5),
                    child: Container(
                      height: 350,
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      child: Image.network(
                        state.timeline[index].image,
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                    )),
                Row(children: [
                  LikeButtons(data: state, index: index),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<CommentsBloc>(context).add(
                            CheckComments(image: state.timeline[index].image));
                        commentBottomSheet(context, state.timeline[index].image,
                            state.timeline[index].uid);
                      },
                      icon: Icon(
                        CupertinoIcons.chat_bubble_text,
                        size: 26,
                      )),
                  SaveButtonTimeline(value: state, index: index),
                  SizedBox(
                      width: 200, child: Text(state.timeline[index].caption))
                ]),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 2, bottom: 10, left: 60, right: 60),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ))
              ]);
            }));
  }
}
