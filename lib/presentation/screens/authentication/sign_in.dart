// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_in_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: SigninFields(),
          ),
        ),
      ),
    );
  }
}
