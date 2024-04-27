// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';

void ShowBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 150,
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 14),
                  child: ListTile(
                    onTap: () {
                      BlocProvider.of<AddPostBloc>(context)
                          .add(ImagePickGalleryEvent());
                      Navigator.pop(context);
                    },
                    title: Text('Gallery'),
                    leading: Icon(Icons.image_rounded),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 14),
                  child: ListTile(
                    onTap: () {
                      BlocProvider.of<AddPostBloc>(context)
                          .add(ImagePickCameraEvent());
                      Navigator.pop(context);
                    },
                    title: Text('Camera'),
                    leading: Icon(Icons.camera),
                  ))
            ]));
      });
}
