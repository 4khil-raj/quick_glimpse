import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/presentation/screens/chat_screen/chat_screen.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
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
              icon: dark
                  ? const Icon(
                      CupertinoIcons.camera,
                      color: Colors.white,
                    )
                  : const Icon(
                      CupertinoIcons.camera,
                      color: Colors.black,
                    )),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  customNavPush(context, ChatScreen());
                  // homeSnackbar(context, 'sanam kail ondo');
                },
                icon: const Icon(
                  size: 27,
                  CupertinoIcons.bolt_horizontal_circle_fill,
                  color: Color.fromARGB(255, 236, 16, 16),
                )),
          )
        ]);
  }
}
