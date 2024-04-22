// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/home.dart';
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
          customNavPush(context, const HomeScreen());
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
