// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/save_post/save_post_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/buttons.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/list_tile.dart';

class TimelineBuilder extends StatelessWidget {
  TimelineBuilder({super.key, required this.state});
  TimeLineLoadSuccessState state;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RandomProfileBloc>(context).add(RandomProfileEvent());
    return SizedBox(
        height: MediaQuery.of(context).size.height - 180,
        child: ListView.builder(
            itemCount: state.timeline.length,
            itemBuilder: (context, index) {
              return Column(children: [
                HomeListTile(state: state, index: index),
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
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
