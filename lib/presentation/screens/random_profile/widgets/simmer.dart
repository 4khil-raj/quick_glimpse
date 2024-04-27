// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_container.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_gridview.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:shimmer/shimmer.dart';

class RandomProfileShimmer extends StatelessWidget {
  const RandomProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 136, 134, 134),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
          padding: const EdgeInsets.only(left: 11, right: 15, bottom: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              CircleAvatar(
                radius: 70,
              ),
              SizedBox(
                width: 40,
              ),
              Column(children: [
                Text(
                  '0',
                  style: GoogleFonts.rubik(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Post',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )
              ]),
              SizedBox(
                width: 30,
              ),
              Column(children: [
                Text(
                  '0',
                  style: GoogleFonts.rubik(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Followers',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )
              ])
            ]),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ShimmerTextHelper(
                        length: 20,
                        width: 250,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ShimmerTextHelper(
                        length: 20,
                        width: 130,
                      ),
                    ],
                  )),
            ),
            customButton(
              isRow: false,
              borderclr: Colors.black,
              color: Colors.black,
              height: 40,
              name: 'Edit Profile',
              radius: 20,
              textclr: Colors.white,
              width: double.infinity,
              textsize: 14,
              onTap: () {},
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  'Post',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
            RandomShimmerGridView()
          ])),
    );
  }
}
