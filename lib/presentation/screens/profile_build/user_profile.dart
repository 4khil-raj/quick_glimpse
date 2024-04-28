// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:quick_glimpse/presentation/screens/profile_build/widgets/using_otp.dart';
import 'package:quick_glimpse/presentation/screens/profile_build/widgets/using_signUp.dart';

class ProfileBuild extends StatelessWidget {
  ProfileBuild({
    required this.usingSignup,
    this.email,
    this.name,
    super.key,
  });
  bool usingSignup;
  String? name;
  String? email;
  @override
  Widget build(BuildContext context) {
    String? pickedImage;
    return BlocBuilder<ProfileBuildBloc, ProfileBuildState>(
        builder: (context, state) {
      if (state is ProfileImageSuccess) {
        pickedImage = state.image.path;
      }
      if (state is ProfileSaveToCredentialSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<BottomNavBloc>(context)
              .add(BottomNavCallEvent(currentIndex: 0));
          customNavRemoveuntil(context, BottomNavigation());
        });
      }
      if (state is ProfileBuildError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(state.message), actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('ok'))
                ]);
              });
        });
      }
      return Scaffold(
          appBar: AppBar(
            title: usingSignup
                ? Text(
                    'Profile Photo',
                    style: GoogleFonts.gabarito(fontSize: 23),
                  )
                : const Text('Set your profile'),
            centerTitle: true,
          ),
          body: usingSignup
              ? ProfileUsingSignUp(
                  email: email!,
                  name: name!,
                  pickedImage: pickedImage,
                )
              : ProfileUsingOpt(pickedImage: pickedImage));
    });
  }
}
