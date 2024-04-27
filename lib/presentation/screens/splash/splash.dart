// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_in.dart';
import 'package:quick_glimpse/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(CheckLoginStatusEvent());
    BlocProvider.of<BottomNavBloc>(context)
        .add(BottomNavCallEvent(currentIndex: 0));

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          customNavReplacement(context, BottomNavigation());
        } else if (state is UnAuthenticated) {
          customNavReplacement(context, SignIn());
        }
      },
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF8EC5FC),
            Color(0xFFE0C3FC),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quick Glimplse',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 16),
              LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.black, size: 50)
            ],
          ),
        ),
      ),
    );
  }
}
