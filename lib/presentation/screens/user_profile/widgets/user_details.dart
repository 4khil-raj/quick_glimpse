// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/grid_post.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class UserDetailsProfile extends StatelessWidget {
  UserDetailsProfile({required this.state, super.key});
  UserFoundSuccessState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              Text(state.post.length.toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              Text('Posts',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ]),
            Align(
              child: CircleAvatar(
                backgroundImage: NetworkImage(state.user.profile),
                radius: 90,
              ),
            ),
            Column(children: [
              Text(state.user.followers.toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              Text('Friends',
                  style: GoogleFonts.rubik(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ])
          ]),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.user.name,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(state.user.bio,
                          style: GoogleFonts.rubik(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    customButton(
                      isRow: false,
                      borderclr: Colors.black,
                      color: Colors.black,
                      height: 36,
                      name: 'Edit Profile',
                      onTap: () {},
                      textclr: Colors.white,
                      radius: 20,
                      textsize: 14,
                      width: double.infinity,
                    )
                  ])),
          Text('Memories',
              style:
                  GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 5,
          ),
          RandomPostGridView(isUser: true, state: state)
        ]));
  }
}
