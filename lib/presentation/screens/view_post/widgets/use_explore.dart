// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
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
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.download_rounded)),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.timeline[index].userImage),
                ),
                title: Text(state.timeline[index].username),
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
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
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