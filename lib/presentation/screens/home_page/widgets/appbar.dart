import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: GradientText(
        colors: const [
          Colors.black,
          Colors.red,
        ],
        'Quick Glimpse',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 23),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(
                'assets/images/e264d8a4-b760-43c7-8fdc-a7c14278efd3.jpg',
              ),
            ),
          ),
        )
      ],
    );
  }
}
