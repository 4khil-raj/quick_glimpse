// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading {
  String name;
  Color? textclr;
  double? textsize;
  CustomLoading({required this.name, this.textclr, this.textsize});

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LoadingAnimationWidget.halfTriangleDot(color: Colors.black, size: 50),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: GoogleFonts.rubik(color: textclr, fontSize: textsize),
          ),
        ],
      ),
    );
  }
}
