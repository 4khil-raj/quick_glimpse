// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/user_info.dart';

class RandomProfile extends StatelessWidget {
  RandomProfile({required this.username, required this.uid, super.key});
  String username;
  String uid;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RandomProfileBloc>(context).add(GetRandomUser(email: uid));
    return Scaffold(
        appBar: AppBar(
          title: Text(username),
        ),
        body: BlocBuilder<RandomProfileBloc, RandomProfileState>(
            builder: (context, state) {
          if (state is UserFoundSuccessState) {
            return CustomUserInfo(
              state: state,
            );
          }
          return RandomProfileShimmer();
        }));
  }
}
