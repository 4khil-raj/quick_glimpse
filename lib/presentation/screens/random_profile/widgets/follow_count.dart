import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/follow_bloc/follow_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';

class FollowCountText extends StatelessWidget {
  const FollowCountText({required this.value, super.key});
  final UserFoundSuccessState value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowBloc, FollowState>(
      builder: (context, state) {
        if (state is FollowSuccessState) {
          return state.count != null
              ? Text(
                  (state.count).toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16, fontWeight: FontWeight.w400),
                )
              : Text(
                  (value.user.followers).toString(),
                  style: GoogleFonts.rubik(
                      fontSize: 16, fontWeight: FontWeight.w400),
                );
        }
        return Text(
          (value.user.followers).toString(),
          style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400),
        );
      },
    );
  }
}
