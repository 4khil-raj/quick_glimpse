// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/follow_button.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/follow_count.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/grid_post.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class CustomUserInfo extends StatelessWidget {
  CustomUserInfo({required this.state, super.key});
  UserFoundSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 11,
          right: 11,
          bottom: 8,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(
              backgroundImage: NetworkImage(state.user.profile),
              radius: 70,
            ),
            SizedBox(
              width: 40,
            ),
            Column(children: [
              Text(
                state.post.length.toString(),
                style: GoogleFonts.rubik(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                'Post',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              )
            ]),
            SizedBox(
              width: 30,
            ),
            Column(children: [
              FollowCountText(
                value: state,
              ),
              Text(
                'Followers',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              )
            ])
          ]),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: SizedBox(
              child: Text(state.user.bio),
              width: double.infinity,
            ),
          ),
          FollowButtonRandomProfile(
            values: state,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'Post',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: RandomPostGridView(
              saved: false,
              isUser: false,
              state: state,
            ),
          ),
        ]));
  }
}
