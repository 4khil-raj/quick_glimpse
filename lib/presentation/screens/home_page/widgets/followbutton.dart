import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/edit_delete/edit_delete_bloc.dart';
import 'package:quick_glimpse/application/follow_bloc/follow_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/main.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class FollowButtonTimeline extends StatelessWidget {
  const FollowButtonTimeline(
      {required this.value, required this.index, super.key});
  final TimeLineLoadSuccessState value;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 9, top: 5, bottom: 0),
        child: users!.uid == value.timeline[index].uid
            ? PopupMenuButton(
                onSelected: (values) {
                  if (values == 'delete') {
                    alertsWithButtons(context, 'Are You Sure..?', () {
                      BlocProvider.of<EditDeleteBloc>(context).add(
                          DeletePostEvent(
                              imageUrl: value.timeline[index].image));
                      Navigator.pop(context);
                    });
                  }
                  // if (value == 'edit') {}
                },
                iconColor: dark ? Colors.white : Colors.black,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                    // PopupMenuItem(
                    //   value: 'edit',
                    //   child: Text('Edit'),
                    // )
                  ];
                })
            : BlocBuilder<FollowBloc, FollowState>(builder: (context, state) {
                if (state is FollowSuccessState) {
                  if (state.list.contains(value.timeline[index].uid)) {
                    return customButton(
                      onTap: () => BlocProvider.of<FollowBloc>(context).add(
                          UnfollowEvent(userUid: value.timeline[index].uid)),
                      isRow: false,
                      borderclr: Colors.transparent,
                      color: Colors.black,
                      height: 30,
                      width: 70,
                      name: 'Unfollow',
                      textclr: Colors.white,
                      textsize: 13,
                      radius: 20,
                    );
                  }
                }
                return customButton(
                  onTap: () => BlocProvider.of<FollowBloc>(context)
                      .add(FollowReqEvent(userUid: value.timeline[index].uid)),
                  isRow: false,
                  borderclr: Colors.transparent,
                  color: Colors.black,
                  height: 30,
                  width: 70,
                  name: 'Follow',
                  textclr: Colors.white,
                  textsize: 13,
                  radius: 20,
                );
              }));
  }
}
