import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_container.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_gridview.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:shimmer/shimmer.dart';

class CurrentUserShimmerEffect extends StatelessWidget {
  const CurrentUserShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 136, 134, 134),
      highlightColor: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(children: [
                Text('0',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                Text('Posts',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ]),
              const Align(
                child: CircleAvatar(
                  radius: 90,
                ),
              ),
              Column(children: [
                Text('0',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                Text('Friends',
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ])
            ]),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ShimmerTextHelper(
                        length: 20,
                        width: 140,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const ShimmerTextHelper(
                        length: 20,
                        width: 230,
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
                        radius: 20,
                        textsize: 14,
                        width: double.infinity,
                      )
                    ])),
            Text('Memories',
                style: GoogleFonts.rubik(
                    fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 5,
            ),
            const RandomShimmerGridView()
          ])),
    );
  }
}
