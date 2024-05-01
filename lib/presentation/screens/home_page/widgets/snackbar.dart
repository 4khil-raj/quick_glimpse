import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

homeSnackbar(context, String msg, Color clr) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      backgroundColor: clr,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bookmark),
          const SizedBox(
            width: 8,
          ),
          Text(
            msg,
            style: GoogleFonts.rubik(fontSize: 14),
          )
        ],
      )));
}
