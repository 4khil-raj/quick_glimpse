import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/follow_bloc/follow_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/snackbar.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class FollowButtonRandomProfile extends StatelessWidget {
  FollowButtonRandomProfile({required this.values, super.key});
  final UserFoundSuccessState values;

  @override
  Widget build(BuildContext context) {
    return values.user.uid == users!.uid
        ? customButton(
            isRow: false,
            borderclr: Colors.black,
            color: Colors.black,
            height: 40,
            name: 'Edit Profile',
            radius: 20,
            textclr: Colors.white,
            width: double.infinity,
            textsize: 14,
            onTap: () {},
          )
        : BlocBuilder<FollowBloc, FollowState>(
            builder: (context, state) {
              if (state is FollowSuccessState) {
                if (state.list.contains(values.user.uid)) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customButton(
                        isRow: false,
                        borderclr: Colors.black,
                        color: Colors.black,
                        height: 40,
                        name: 'Message',
                        radius: 20,
                        textclr: Colors.white,
                        width: MediaQuery.of(context).size.width / 2.5,
                        textsize: 14,
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      customButton(
                        isRow: false,
                        borderclr: Colors.black,
                        color: Colors.black,
                        height: 40,
                        name: 'Unfollow',
                        radius: 20,
                        textclr: Colors.white,
                        width: MediaQuery.of(context).size.width / 2.5,
                        textsize: 14,
                        onTap: () {
                          homeSnackbar(context, 'Unfollowing...',
                              const Color.fromARGB(255, 0, 0, 0));
                          BlocProvider.of<FollowBloc>(context)
                              .add(UnfollowEvent(userUid: values.user.uid));
                        },
                      )
                    ],
                  );
                }
              }
              return customButton(
                isRow: false,
                borderclr: Colors.black,
                color: Colors.black,
                height: 40,
                name: 'Follow',
                radius: 20,
                textclr: Colors.white,
                width: double.infinity,
                textsize: 14,
                onTap: () {
                  homeSnackbar(context, 'Following...',
                      const Color.fromARGB(255, 0, 0, 0));
                  BlocProvider.of<FollowBloc>(context)
                      .add(FollowReqEvent(userUid: values.user.uid));
                },
              );
            },
          );
  }
}
