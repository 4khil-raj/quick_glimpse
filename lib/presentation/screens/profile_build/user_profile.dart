import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class ProfileBuild extends StatelessWidget {
  const ProfileBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBuildBloc, ProfileBuildState>(
      builder: (context, state) {
        String? pickedImage;

        if (state is ProfileImageSuccess) {
          pickedImage = state.image.path;
          print(pickedImage);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Set your profile'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<ProfileBuildBloc>(context)
                        .add(ProfleImagePickerEvent());
                  },
                  child: CircleAvatar(
                    backgroundImage: pickedImage != null
                        ? FileImage(File(pickedImage))
                        : null,
                    radius: 90,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Enter Your name',
                  controller: TextEditingController(), // Add your controller
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Enter Your Email',
                  controller: TextEditingController(), // Add your controller
                ),
                SizedBox(
                  height: 20,
                ),
                customButton(
                  isRow: false,
                  borderclr: Colors.transparent,
                  color: Colors.black,
                  name: 'Continue',
                  height: 50,
                  textclr: Colors.white,
                  onTap: () {},
                  textsize: 15,
                  radius: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
