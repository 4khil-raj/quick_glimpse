// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/bottomsheet.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    String? image;
    final captionController = TextEditingController();
    bool selected = false;
    return BlocBuilder<AddPostBloc, AddPostState>(
      builder: (context, state) {
        if (state is ImageGallerySuccess) {
          image = state.image.path;
          selected = true;
        } else if (state is ImageCameraSuccess) {
          image = state.image.path;
          selected = true;
        } else if (state is PostErrorState) {
          alerts(context, state.messege);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Post Something',
              style: GoogleFonts.poppins(),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          ShowBottomSheet(context);
                          BlocProvider.of<AddPostBloc>(context)
                              .add(ChangeImageEvent());
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
                                  : DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/828e6fa5-c84f-4899-8971-cdd27b2c3892.jpg',
                                      )),
                              border: Border.all()),
                          height: 400,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          hintText: 'Caption', controller: captionController),
                      SizedBox(
                        height: 10,
                      ),
                      customButton(
                        onTap: () {
                          if (image != null) {
                            BlocProvider.of<AddPostBloc>(context).add(
                                NewPostEvent(
                                    caption: captionController.text,
                                    image: image!,
                                    like: '0'));
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
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
