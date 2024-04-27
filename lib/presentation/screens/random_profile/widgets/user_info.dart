// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/grid_post.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class CustomUserInfo extends StatelessWidget {
  CustomUserInfo({required this.state, super.key});
  UserFoundSuccessState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 11, right: 15, bottom: 8),
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
              Text(
                state.user.followers.toString(),
                style: GoogleFonts.rubik(
                    fontSize: 16, fontWeight: FontWeight.w400),
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
          customButton(
            isRow: false,
            borderclr: Colors.black,
            color: Colors.black,
            height: 40,
            name: 'Follow',
            radius: 20,
            textclr: Colors.white,
            width: double.infinity,
            textsize: 14,
            onTap: () {},
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
          RandomPostGridView(
            state: state,
          ),
        ]));
  }
}
