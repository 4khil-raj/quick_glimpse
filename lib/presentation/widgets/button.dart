// ignore_for_file: sort_child_properties_last, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customButton extends StatelessWidget {
  double? height;
  double? width;
  String? image;
  String? name;
  double? textsize;
  Color? color;
  double? radius;
  Color? borderclr;
  Color? textclr;
  bool? isNetwork = true;
  bool isRow;
  Function()? onTap;
  customButton(
      {this.isNetwork,
      super.key,
      this.height,
      this.textsize,
      required this.isRow,
      this.image,
      this.width,
      this.color,
      this.radius,
      this.borderclr,
      this.textclr,
      this.onTap,
      this.name});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Align(
            alignment: Alignment.center,
            child: isRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isNetwork!
                          ? CircleAvatar(
                              backgroundImage: NetworkImage('$image'),
                            )
                          : CircleAvatar(backgroundImage: AssetImage('$image')),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        name!,
                        style: GoogleFonts.rubik(
                            color: textclr, fontSize: textsize),
                      ),
                    ],
                  )
                : Text(
                    name!,
                    style:
                        GoogleFonts.rubik(color: textclr, fontSize: textsize),
                  )),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius!),
            border: Border.all(color: borderclr!)),
      ),
    );
  }
}
