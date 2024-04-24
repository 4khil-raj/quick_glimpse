import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/main.dart';
import 'package:quick_glimpse/presentation/screens/add_post/add_post.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: GradientText(
        colors: [
          dark ? Colors.white : Colors.black,
          Colors.red,
        ],
        'Quick Glimpse',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 23),
      ),
      actions: [
        IconButton(
            onPressed: () {
              BlocProvider.of<AddPostBloc>(context).add(ChangeImageEvent());
              customNavPush(context, AddPost());
            },
            icon: const Icon(CupertinoIcons.camera)),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              radius: 13,
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
