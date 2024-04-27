// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/add_post/widgets/screen.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});
  bool postReq = false;
  @override
  Widget build(BuildContext context) {
    String? image;
    final captionController = TextEditingController();
    bool selected = false;
    return BlocBuilder<AddPostBloc, AddPostState>(builder: (context, state) {
      if (state is ImageGallerySuccess) {
        image = state.image.path;
        selected = true;
      } else if (state is ImageCameraSuccess) {
        image = state.image.path;
        selected = true;
      } else if (state is PostErrorState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          alerts(context, state.messege);
        });
        postReq = false;
      } else if (state is PostButtonPressState) {
        postReq = true;
      } else if (state is PostDoneState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          BlocProvider.of<TimelineBloc>(context).add(TimelineShowEvent());
          Navigator.pop(context);
        });
      }
      return Scaffold(
          appBar: AppBar(
              title: Text(
            'Post Something',
            style: GoogleFonts.poppins(),
          )),
          body: PostScreen(
            captionController: captionController,
            image: image,
            postReq: postReq,
            selected: selected,
          ));
    });
  }
}
