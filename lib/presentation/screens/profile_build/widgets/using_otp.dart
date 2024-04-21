// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class ProfileUsingOpt extends StatelessWidget {
  ProfileUsingOpt({super.key, required this.pickedImage});
  String? pickedImage;
  final emailC = TextEditingController();
  final nameC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<ProfileBuildBloc>(context)
                      .add(ChangeImageEvent());
                  BlocProvider.of<ProfileBuildBloc>(context)
                      .add(ProfleImagePickerEvent());
                },
                child: CircleAvatar(
                  backgroundImage: pickedImage != null
                      ? FileImage(File(pickedImage!))
                      : null,
                  radius: 90,
                  child: pickedImage == null
                      ? const Icon(Icons.add_a_photo)
                      : null,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                hintText: 'Enter Your name',
                controller: nameC, // Add your controller
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                hintText: 'Enter Your Email',
                controller: emailC,
              ),
              const SizedBox(
                height: 25,
              ),
              customButton(
                isRow: false,
                borderclr: Colors.transparent,
                color: Colors.black,
                name: 'Continue',
                height: 50,
                textclr: Colors.white,
                onTap: () {
                  BlocProvider.of<ProfileBuildBloc>(context).add(
                    ProfileSaveToCredential(
                      email: emailC.text,
                      name: nameC.text,
                      image: pickedImage!,
                    ),
                  );
                },
                textsize: 15,
                radius: 20,
              )
            ]))
      ]),
    );
  }
}
