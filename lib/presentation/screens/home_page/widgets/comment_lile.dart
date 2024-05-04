import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/comments/comments_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class CommentListTile extends StatelessWidget {
  CommentListTile({required this.index, required this.state, super.key});
  CommentsFound state;
  int index;

  @override
  Widget build(BuildContext context) {
    return users!.uid == state.comments[index].commentedUser
        ? Slidable(
            startActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                label: 'Remove',
                onPressed: (context) {
                  BlocProvider.of<CommentsBloc>(context).add(DeleteCommentEvent(
                      image: state.comments[index].image,
                      commentId: state.comments[index].commentId));
                },
                icon: Icons.delete,
                autoClose: true,
                backgroundColor: Colors.red,
                // borderRadius: BorderRadius.circular(20),
              )
            ]),
            child: ListTile(
                onTap: () {
                  customNavPush(
                      context,
                      RandomProfile(
                        username: state.comments[index].commentedUserName,
                        uid: state.comments[index].commentedUser,
                      ));
                  BlocProvider.of<RandomProfileBloc>(context).add(GetRandomUser(
                      email: state.comments[index].commentedUser));
                },
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.comments[index].commentedUserImage),
                ),
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          state.comments[index].commentedUserName,
                          style: TextStyle(fontSize: 14.5),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(state.comments[index].commentedTime,
                            style: TextStyle(fontSize: 12))
                      ]),
                      Text(state.comments[index].comment)
                    ])),
          )
        : ListTile(
            onTap: () {
              customNavPush(
                  context,
                  RandomProfile(
                    username: state.comments[index].commentedUserName,
                    uid: state.comments[index].commentedUser,
                  ));
              BlocProvider.of<RandomProfileBloc>(context).add(
                  GetRandomUser(email: state.comments[index].commentedUser));
            },
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(state.comments[index].commentedUserImage),
            ),
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(
                  state.comments[index].commentedUserName,
                  style: TextStyle(fontSize: 14.5),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(state.comments[index].commentedTime,
                    style: TextStyle(fontSize: 12))
              ]),
              Text(state.comments[index].comment)
            ]));
  }
}
