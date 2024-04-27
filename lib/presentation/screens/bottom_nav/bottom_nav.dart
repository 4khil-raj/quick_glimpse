// ignore_for_file: prefer_const_constructors

import 'package:dynamic_curved_navigation_bar/dynamic_curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_curved_navigation_bar/dynamic_curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/main.dart';
import 'package:quick_glimpse/presentation/screens/home_page/home.dart';
import 'package:quick_glimpse/presentation/screens/nottification_page/nottification_page.dart';
import 'package:quick_glimpse/presentation/screens/search/search.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/user_profile.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  List screens = [UserHome(), SearchPage(), UserProfile(), NottificationPage()];
  String? image;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BottomNavBloc>(context).add(BottomImageEvent());
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        if (state is BottomImageState) {
          image = state.profile;
        }
        return Scaffold(
            bottomNavigationBar: DynamicCurvedNavigationBar(
              height: 60,
              // buttonBackgroundColor: Colors.transparent,
              // buttonBackgroundColor: Color.fromARGB(255, 102, 182, 188),
              color: dark ? Colors.red : Color(0xFF2B8EE2),
              backgroundColor: Colors.black,
              items: [
                DynamicCurvedNavigationBarItem(
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  child: Icon(
                    Icons.home_outlined,
                    size: 29,
                  ),
                  label: 'Feed',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  child: Icon(CupertinoIcons.search),
                  label: 'Search',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(image ??
                        'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                    radius: 20,
                  ),
                  label: 'Me',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  child: Icon(CupertinoIcons.bell),
                  label: 'Alerts',
                ),
              ],
              index: state.emittingIndex,
              onTap: (index) {
                BlocProvider.of<BottomNavBloc>(context)
                    .add(BottomNavCallEvent(currentIndex: index));
              },
            ),
            body: screens.elementAt(state.emittingIndex));
      },
    );
  }
}
