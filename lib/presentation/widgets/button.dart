// ignore_for_file: sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class customButton extends StatelessWidget {
  double? height;
  double? width;
  String? name;
  Color? color;
  double? radius;
  Color? borderclr;
  Color? textclr;
  customButton(
      {this.height,
      this.width,
      this.color,
      this.radius,
      this.borderclr,
      this.textclr,
      this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.center,
          child: Text(
            name!,
            style: GoogleFonts.rubik(color: textclr),
          )),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius!),
          border: Border.all(color: borderclr!)),
    );
  }
}
