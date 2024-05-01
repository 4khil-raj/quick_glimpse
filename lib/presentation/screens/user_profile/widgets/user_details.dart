// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/grid_post.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/widgets/bio.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/widgets/saved.dart';

class UserDetailsProfile extends StatelessWidget {
  UserDetailsProfile({required this.state, super.key});
  UserFoundSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: DefaultTabController(
            length: 2,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  Text(state.post.length.toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Posts',
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))
                ]),
                Align(
                    child: CircleAvatar(
                  backgroundImage: NetworkImage(state.user.profile),
                  radius: 90,
                )),
                Column(children: [
                  Text(state.user.followers.toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Friends',
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))
                ])
              ]),
              BioandName(
                state: state,
              ),
              const SizedBox(height: 10),
              const TabBar(tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.grid_on_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Tab(text: 'Memories'),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.bookmark),
                  SizedBox(
                    width: 5,
                  ),
                  Tab(text: 'Saved'),
                ])
              ]),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: TabBarView(children: [
                RandomPostGridView(isUser: true, state: state),
                SavedPostProfile(isUser: true, state: state),
              ]))
            ])));
  }
}
