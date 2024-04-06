// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  'Hello Again!',
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Sign in to Your Account',
                style: GoogleFonts.rubik(fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                hintText: 'Username',
                controller: usernameController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hintText: 'Passcode', controller: passwordController),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'forget your passcode',
                        style: TextStyle(color: Colors.blue),
                      ))),
              customButton(
                textclr: Colors.white,
                name: 'Sign In',
                height: 50.0,
                width: 210.0,
                radius: 20.0,
                color: Colors.black,
                borderclr: Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
