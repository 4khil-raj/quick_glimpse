// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/presentation/screens/add_post/widgets/buttons.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/bottomsheet.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class PostScreen extends StatelessWidget {
  PostScreen(
      {required this.image,
      required this.postReq,
      required this.captionController,
      required this.selected,
      super.key});
  TextEditingController captionController;
  String? image;
  bool postReq;
  bool selected;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  InkWell(
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ShowBottomSheet(context);
                        BlocProvider.of<AddPostBloc>(context)
                            .add(ChangeImageEvent());
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: selected
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(
                                      image!,
                                    ),
                                  ))
                              : const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/828e6fa5-c84f-4899-8971-cdd27b2c3892.jpg',
                                  )),
                          border: Border.all()),
                      height: 400,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      maxlength: 15,
                      hintText: 'Caption',
                      controller: captionController),
                  const SizedBox(
                    height: 10,
                  ),
                  PostButtons(
                      postReq: postReq,
                      image: image,
                      captionController: captionController)
                ]))));
  }
}
