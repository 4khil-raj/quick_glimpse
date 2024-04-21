// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class ProfileUsingSignUp extends StatelessWidget {
  ProfileUsingSignUp(
      {super.key,
      required this.pickedImage,
      required this.email,
      required this.name});
  String? pickedImage;
  String name;
  String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                BlocProvider.of<ProfileBuildBloc>(context)
                    .add(ChangeImageEvent());
                BlocProvider.of<ProfileBuildBloc>(context)
                    .add(ProfleImagePickerEvent());
              },
              child: CircleAvatar(
                backgroundImage:
                    pickedImage != null ? FileImage(File(pickedImage!)) : null,
                radius: 150,
                child:
                    pickedImage == null ? const Icon(Icons.add_a_photo) : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customButton(
              isRow: false,
              borderclr: Colors.transparent,
              color: Colors.black,
              name: 'Save',
              height: 50,
              textclr: Colors.white,
              onTap: () {
                BlocProvider.of<ProfileBuildBloc>(context).add(
                  ProfileSaveToCredential(
                    email: email,
                    name: name,
                    image: pickedImage!,
                  ),
                );
              },
              textsize: 15,
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
