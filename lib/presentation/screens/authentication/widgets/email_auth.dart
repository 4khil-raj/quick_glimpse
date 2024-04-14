// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/domain/validations/formfield_validation.dart';
import 'package:quick_glimpse/presentation/screens/authentication/forget_passcode.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class EmailAuthScreen extends StatelessWidget {
  final auth;
  final formkey;
  const EmailAuthScreen({super.key, required this.auth, required this.formkey});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(children: [
      CustomTextFormField(
        validator: Validations.validateEmail,
        hintText: 'Email',
        controller: usernameController,
      ),
      SizedBox(
        height: 20,
      ),
      CustomTextFormField(
          validator: Validations.validateCreatepassword,
          hintText: 'Passcode',
          controller: passwordController),
      Align(
          alignment: Alignment.topRight,
          child: TextButton(
              onPressed: () {
                customNavPush(context, ForgetPasscode());
              },
              child: Text(
                'forget your passcode',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 1, 10, 174)),
              ))),
      SizedBox(
        height: 2,
      ),
      customButton(
        onTap: () {
          formkey.currentState!.validate();
          auth.add(LoginEvent(
              email: usernameController.text.trim(),
              passcode: passwordController.text.trim()));
        },
        textsize: 16,
        isRow: false,
        textclr: Colors.white,
        name: 'Sign In',
        height: 60.0,
        width: double.infinity,
        radius: 20.0,
        color: Colors.black,
        borderclr: Colors.transparent,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        'Or with',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5),
      )
    ]);
  }
}
