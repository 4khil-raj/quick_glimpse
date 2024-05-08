import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/alerts_bloc/alerts_bloc.dart';
import 'package:quick_glimpse/application/follow_bloc/follow_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/snackbar.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class AlertsFollowersGridView extends StatelessWidget {
  const AlertsFollowersGridView({required this.values, super.key});
  final AlertsSuccessState values;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: values.follower.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 160,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<FollowBloc>(context)
                          .add(CheckFollowEvent());
                      customNavPush(
                          context,
                          RandomProfile(
                            username: values.follower[index].name,
                            uid: values.follower[index].uid,
                          ));
                      BlocProvider.of<RandomProfileBloc>(context).add(
                          GetRandomUser(email: values.follower[index].uid));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 168, 167, 164),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          const SizedBox(
                            height: 7,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(values.follower[index].profile),
                            radius: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(values.follower[index].name,
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                          BlocBuilder<FollowBloc, FollowState>(
                            builder: (context, state) {
                              if (state is FollowSuccessState) {
                                if (state.list
                                    .contains(values.follower[index].uid)) {
                                  return customButton(
                                    isRow: false,
                                    borderclr: Colors.black,
                                    color: Colors.black,
                                    height: 25,
                                    name: 'Unfollow',
                                    onTap: () {
                                      homeSnackbar(context, 'Unfollowing...',
                                          const Color.fromARGB(255, 0, 0, 0));
                                      BlocProvider.of<FollowBloc>(context).add(
                                          UnfollowEvent(
                                              userUid:
                                                  values.follower[index].uid));
                                    },
                                    radius: 20,
                                    textclr: Colors.white,
                                    textsize: 12,
                                    width: 100,
                                  );
                                }
                              }
                              return customButton(
                                isRow: false,
                                borderclr: Colors.black,
                                color: Colors.black,
                                height: 25,
                                name: 'Follow Back',
                                onTap: () {
                                  homeSnackbar(context, 'Following...',
                                      const Color.fromARGB(255, 0, 0, 0));
                                  BlocProvider.of<FollowBloc>(context).add(
                                      FollowReqEvent(
                                          userUid: values.follower[index].uid));
                                },
                                radius: 20,
                                textclr: Colors.white,
                                textsize: 12,
                                width: 100,
                              );
                            },
                          )
                        ])),
                  );
                })));
  }
}
