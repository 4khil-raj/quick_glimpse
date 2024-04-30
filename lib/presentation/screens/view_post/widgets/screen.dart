// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/edit_delete/edit_delete_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/main.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class UsingProfileScreen extends StatelessWidget {
  UsingProfileScreen(
      {required this.index,
      required this.isUser,
      required this.data,
      super.key});
  UserFoundSuccessState data;
  int index;
  bool isUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.post[index].username),
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: ListTile(
                onTap: () {
                  customNavPush(
                      context,
                      RandomProfile(
                        username: data.post[index].username,
                        uid: data.post[index].uid,
                      ));
                  BlocProvider.of<RandomProfileBloc>(context)
                      .add(GetRandomUser(email: data.post[index].uid));
                },
                trailing: isUser
                    ? PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'delete') {
                            alertsWithButtons(context, 'Are You Sure..?', () {
                              BlocProvider.of<EditDeleteBloc>(context).add(
                                  DeletePostEvent(
                                      imageUrl: data.post[index].image));
                              Navigator.pop(context);
                            });
                          }
                          if (value == 'edit') {}
                        },
                        iconColor: dark ? Colors.white : Colors.black,
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            )
                          ];
                        })
                    : IconButton(
                        onPressed: () {}, icon: Icon(Icons.download_rounded)),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data.post[index].userImage),
                ),
                title: Text(data.post[index].username),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
              child: Container(
                  height: 400,
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    data.post[index].image,
                    fit: BoxFit.cover,
                  ))),
          Row(children: [
            SizedBox(
              width: 10,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble_text)),
            SizedBox(width: 200, child: Text(data.post[index].caption))
          ])
        ]));
  }
}