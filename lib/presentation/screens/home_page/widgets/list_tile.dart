// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/followbutton.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class HomeListTile extends StatelessWidget {
  HomeListTile({super.key, required this.value, required this.index});
  TimeLineLoadSuccessState value;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: ListTile(
          onTap: () {
            customNavPush(
                context,
                RandomProfile(
                  username: value.timeline[index].username,
                  uid: value.timeline[index].uid,
                ));
            BlocProvider.of<RandomProfileBloc>(context)
                .add(GetRandomUser(email: value.timeline[index].uid));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(value.timeline[index].userImage),
            radius: 24,
          ),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              value.timeline[index].username,
              style:
                  GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              value.timeline[index].time,
              style: const TextStyle(fontSize: 10),
            )
          ]),
          trailing: FollowButtonTimeline(
            value: value,
            index: index,
          ),
        ));
  }
}
