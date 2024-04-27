// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class PostButtons extends StatelessWidget {
  PostButtons(
      {super.key,
      required this.postReq,
      required this.image,
      required this.captionController});
  bool postReq;
  var image;
  TextEditingController captionController;
  @override
  Widget build(BuildContext context) {
    return postReq
        ? Container(
            child:
                LoadingAnimationWidget.inkDrop(color: Colors.white, size: 20),
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        : customButton(
            onTap: () {
              postReq = true;
              if (image != null) {
                BlocProvider.of<AddPostBloc>(context).add(NewPostEvent(
                    caption: captionController.text, image: image!, like: '0'));
              } else {
                alerts(context, 'Select Image');
              }
            },
            isRow: false,
            borderclr: Colors.transparent,
            color: Colors.black,
            height: 40,
            name: 'Post',
            textsize: 15,
            radius: 20,
            width: 100,
            textclr: Colors.white,
          );
  }
}
