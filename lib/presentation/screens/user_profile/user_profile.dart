// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/widgets/appbar.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/widgets/shimmer.dart';
import 'package:quick_glimpse/presentation/screens/user_profile/widgets/user_details.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RandomProfileBloc>(context)
        .add(GetRandomUser(email: users!.uid!));
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60), child: ProfileAppBar()),
        body: BlocBuilder<RandomProfileBloc, RandomProfileState>(
            builder: (context, state) {
          if (state is UserFoundSuccessState) {
            return UserDetailsProfile(
              state: state,
            );
          }
          return CurrentUserShimmerEffect();
        }));
  }
}
