// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/like_buttons.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/save_buttons.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class ViewPostUsingExplorer extends StatelessWidget {
  ViewPostUsingExplorer(
      {required this.index,
      required this.isUser,
      required this.state,
      super.key});
  TimeLineLoadSuccessState state;
  int index;
  bool isUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(state.timeline[index].username),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: ListTile(
                onTap: () {
                  customNavPush(
                      context,
                      RandomProfile(
                        username: state.timeline[index].username,
                        uid: state.timeline[index].uid,
                      ));
                  BlocProvider.of<RandomProfileBloc>(context)
                      .add(GetRandomUser(email: state.timeline[index].uid));
                },
                trailing: SaveButtonTimeline(value: state, index: index),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.timeline[index].userImage),
                ),
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.timeline[index].username,
                        style: GoogleFonts.rubik(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        state.timeline[index].time,
                        style: const TextStyle(fontSize: 10),
                      )
                    ]),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
                child: Container(
                  height: 400,
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    state.timeline[index].image,
                    fit: BoxFit.cover,
                  ),
                )),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                LikeButtons(data: state, index: index),
                IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.chat_bubble_text)),
                SizedBox(width: 200, child: Text(state.timeline[index].caption))
              ],
            )
          ],
        ));
  }
}
