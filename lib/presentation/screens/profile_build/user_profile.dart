import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/home.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class ProfileBuild extends StatelessWidget {
  const ProfileBuild({
    super.key,
  });
  // bool usingSignup;
  @override
  Widget build(BuildContext context) {
    final emailC = TextEditingController();
    final nameC = TextEditingController();
    String? pickedImage;
    return BlocBuilder<ProfileBuildBloc, ProfileBuildState>(
        builder: (context, state) {
      if (state is ProfileImageSuccess) {
        pickedImage = state.image.path;
      }
      if (state is ProfileSaveToCredentialSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          customNavPush(context, const HomeScreen());
        });
      }
      if (state is ProfileBuildError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(state.message), actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('ok'))
                ]);
              });
        });
      }
      return Scaffold(
          appBar: AppBar(
            title: const Text('Set your profile'),
            centerTitle: true,
          ),
          body: CustomScrollView(slivers: <Widget>[
            SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            controller: emailC, // Add your controller
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
                        ])))
          ]));
    });
  }
}
