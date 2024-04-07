// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/domain/validations/formfield_validation.dart';
import 'package:quick_glimpse/presentation/screens/sign_in/sign_in.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

final createPasscodeController = TextEditingController();

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailContoller = TextEditingController();
  final conformPasscodeContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color.fromARGB(255, 146, 232, 148),
          Color.fromARGB(255, 187, 132, 239),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Register',
                    style: GoogleFonts.poppins(
                        fontSize: 29, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  validator: Validations.nameValidator,
                  hintText: 'Enter your Name',
                  controller: usernameController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    keyboardType: TextInputType.phone,
                    validator: Validations.phoneValidator,
                    hintText: 'Phone',
                    controller: phoneController),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: Validations.validateEmail,
                    hintText: 'Email',
                    controller: emailContoller),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    validator: Validations.validateCreatepassword,
                    hintText: 'Create Passcode',
                    controller: createPasscodeController),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    validator: Validations.validateConformpassword,
                    hintText: 'Conform Passcode',
                    controller: conformPasscodeContoller),
                SizedBox(
                  height: 20,
                ),
                customButton(
                  isRow: false,
                  color: Colors.black,
                  height: 50,
                  borderclr: Colors.black,
                  name: "SignUp",
                  radius: 20,
                  textsize: 18,
                  width: double.infinity,
                  textclr: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You have account?Let\'s',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    TextButton(
                        onPressed: () {
                          customNavPush(context, SignIn());
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 1, 10, 174)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
