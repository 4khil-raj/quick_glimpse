import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class BioandName extends StatelessWidget {
  BioandName({super.key, required this.state});
  UserFoundSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(state.user.name,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(state.user.bio,
                style: GoogleFonts.rubik(
                    fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 7,
          ),
          customButton(
            isRow: false,
            borderclr: Colors.black,
            color: Colors.black,
            height: 36,
            name: 'Edit Profile',
            onTap: () {},
            textclr: Colors.white,
            radius: 20,
            textsize: 14,
            width: double.infinity,
          )
        ]));
  }
}
