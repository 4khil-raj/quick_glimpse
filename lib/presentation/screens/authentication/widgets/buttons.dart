// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_glimpse/application/google_auth/google_auth_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/authentication/otp_screen.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

// ignore: must_be_immutable
class CustomGoogleButton extends StatelessWidget {
  bool google;
  CustomGoogleButton({super.key, required this.google});

  @override
  Widget build(BuildContext context) {
    return google
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Align(
                alignment: Alignment.center,
                child: LoadingAnimationWidget.discreteCircle(
                    secondRingColor: Colors.green,
                    thirdRingColor: Colors.blue,
                    color: Colors.red,
                    size: 32)),
            width: double.infinity,
            height: 60,
          )
        : customButton(
            onTap: () =>
                context.read<GoogleAuthBloc>().add(GoogleSigninEvent()),
            isRow: true,
            color: Colors.black,
            height: 60,
            width: double.infinity,
            borderclr: Colors.black,
            name: 'Continue with Google',
            radius: 20,
            textclr: Colors.white,
            image:
                'https://static1.xdaimages.com/wordpress/wp-content/uploads/2020/05/Google-Search-Dark.jpeg',
          );
  }
}

class CustomPhoneButton extends StatelessWidget {
  const CustomPhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return customButton(
      onTap: () {
        customNavPush(context, const UsingPhone());
      },
      isRow: true,
      color: Colors.black,
      height: 60,
      width: double.infinity,
      borderclr: Colors.black,
      name: 'Continue with Phone',
      radius: 20,
      textclr: Colors.white,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIqjeAkumdjSNVIFp14BPW__cZlCqRx3QqkOE_Xo8jpQ&s',
    );
  }
}
