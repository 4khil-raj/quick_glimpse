import 'package:dynamic_curved_navigation_bar/dynamic_curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_curved_navigation_bar/dynamic_curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/presentation/screens/add_post/add_post.dart';
import 'package:quick_glimpse/presentation/screens/home_page/home.dart';
import 'package:quick_glimpse/presentation/screens/nottification_page/nottification_page.dart';
import 'package:quick_glimpse/presentation/screens/search/search.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/user_profile.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  List screens = const [
    UserHome(),
    SearchPage(),
    AddPost(),
    NottificationPage(),
    UserProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: DynamicCurvedNavigationBar(
              backgroundColor: Colors.indigo,
              items: const [
                DynamicCurvedNavigationBarItem(
                  labelStyle: TextStyle(fontSize: 16),
                  child: Icon(CupertinoIcons.home),
                  label: 'Feed',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: TextStyle(fontSize: 16),
                  child: Icon(CupertinoIcons.search),
                  label: 'Search',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: TextStyle(fontSize: 16),
                  child: Icon(CupertinoIcons.photo_camera),
                  label: 'Add',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: TextStyle(fontSize: 16),
                  child: Icon(Icons.favorite_border),
                  label: 'Feed',
                ),
                DynamicCurvedNavigationBarItem(
                  labelStyle: TextStyle(fontSize: 15),
                  child: CircleAvatar(
                    radius: 20,
                  )
                  // Icon(CupertinoIcons.person)
                  ,
                  label: 'Profile',
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
