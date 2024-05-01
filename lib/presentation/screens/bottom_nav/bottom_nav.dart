// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/home.dart';
import 'package:quick_glimpse/presentation/screens/nottification_page/nottification_page.dart';
import 'package:quick_glimpse/presentation/screens/search/search.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/user_profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  List screens = [UserHome(), SearchPage(), UserProfile(), NottificationPage()];
  String? image;
  String? name;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BottomNavBloc>(context).add(BottomImageEvent());
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        if (state is BottomImageState) {
          image = state.profile;
          name = state.name!;
        }
        return Scaffold(
            bottomNavigationBar: SalomonBottomBar(
              unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              margin: EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
              curve: Curves.decelerate,
              currentIndex: state.emittingIndex,
              onTap: (index) {
                BlocProvider.of<BottomNavBloc>(context)
                    .add(BottomNavCallEvent(currentIndex: index));
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home_rounded),
                  title: Text("Home"),
                  selectedColor: const Color.fromARGB(255, 218, 5, 255),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.explore_outlined),
                  title: Text("Explore"),
                  selectedColor: Colors.pink,
                ),
                SalomonBottomBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(image ??
                          'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                      radius: 15,
                    ),
                  ),
                  title: Text(
                    name?.split(' ').first ?? 'Me',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  selectedColor: Colors.teal,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.flash_on_rounded),
                  title: Text("Alert"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
              ],
            ),
            body: screens.elementAt(state.emittingIndex));
      },
    );
  }
}
