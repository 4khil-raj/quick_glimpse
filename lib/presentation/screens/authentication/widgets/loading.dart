import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginLoading extends StatelessWidget {
  const LoginLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LoadingAnimationWidget.halfTriangleDot(color: Colors.black, size: 40),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Loading',
            style: GoogleFonts.rubik(color: Colors.black, fontSize: 50),
          ),
        ],
      ),
    );
  }
}
