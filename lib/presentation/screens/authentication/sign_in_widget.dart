// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/domain/validations/formfield_validation.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_up.dart';
import 'package:quick_glimpse/presentation/screens/home.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class SigninFields extends StatelessWidget {
  SigninFields({
    super.key,
  });
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          customNavPush(context, HomeScreen());
        });
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello Again!',
            style:
                GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            'Sign in to Your Account',
            style: GoogleFonts.rubik(fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
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
              alignment: Alignment.topLeft,
              child: TextButton(
                  onPressed: () {},
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
          ),
          SizedBox(
            height: 16,
          ),
          customButton(
            isRow: true,
            color: Colors.black,
            height: 60,
            width: double.infinity,
            borderclr: Colors.black,
            name: 'Continue with Google',
            radius: 20,
            textclr: Colors.white,
            image:
                'https://static1.xdaimages.com/wordpress/wp-content/uploads/2020/05/Google-Search-Dark.jpeg',
          ),
          SizedBox(
            height: 15,
          ),
          customButton(
            isRow: true,
            color: Colors.black,
            height: 60,
            width: double.infinity,
            borderclr: Colors.black,
            name: 'Continue with Phone',
            radius: 20,
            textclr: Colors.white,
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIqjeAkumdjSNVIFp14BPW__cZlCqRx3QqkOE_Xo8jpQ&s',
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dont\'t have account?Let\'s',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
              TextButton(
                  onPressed: () {
                    customNavReplacement(context, SignUp());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 1, 10, 174)),
                  ))
            ],
          )
        ],
      );
    });
  }
}
