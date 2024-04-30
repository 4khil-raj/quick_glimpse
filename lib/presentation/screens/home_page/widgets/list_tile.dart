// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class HomeListTile extends StatelessWidget {
  HomeListTile({super.key, required this.state, required this.index});
  TimeLineLoadSuccessState state;
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
                  username: state.timeline[index].username,
                  uid: state.timeline[index].uid,
                ));
            BlocProvider.of<RandomProfileBloc>(context)
                .add(GetRandomUser(email: state.timeline[index].uid));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(state.timeline[index].userImage),
            radius: 24,
          ),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              state.timeline[index].username,
              style:
                  GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              state.timeline[index].time,
              style: const TextStyle(fontSize: 10),
            )
          ]),
          trailing: Padding(
              padding: const EdgeInsets.only(right: 9, top: 5, bottom: 0),
              child: customButton(
                isRow: false,
                borderclr: Colors.transparent,
                color: Colors.black,
                height: 30,
                width: 70,
                name: 'Follow',
                textclr: Colors.white,
                textsize: 13,
                radius: 20,
              )),
        ));
  }
}
