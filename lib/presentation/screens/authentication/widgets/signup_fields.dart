// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/domain/validations/formfield_validation.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_up.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class SignupFormFields extends StatelessWidget {
  const SignupFormFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Register',
            style:
                GoogleFonts.poppins(fontSize: 29, fontWeight: FontWeight.bold)),
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
      ],
    );
  }
}
