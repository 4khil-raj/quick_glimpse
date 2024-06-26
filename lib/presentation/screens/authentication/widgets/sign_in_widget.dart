// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/application/google_auth/google_auth_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/authentication/widgets/buttons.dart';
import 'package:quick_glimpse/presentation/screens/authentication/widgets/email_auth.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_up.dart';
import 'package:quick_glimpse/presentation/screens/authentication/widgets/loading.dart';
import 'package:quick_glimpse/presentation/screens/bottom_nav/bottom_nav.dart';

class SigninFields extends StatelessWidget {
  SigninFields({
    super.key,
  });
  final _formkey = GlobalKey<FormState>();
  bool Google = false;
  @override
  Widget build(BuildContext context) {
    // final auth = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoading) {
        return LoginLoading();
      } else if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          customNavRemoveuntil(context, BottomNavigation());
        });
      } else if (state is AuthError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.message!)));
        });
      }
      return Form(
          key: _formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Hello Again!',
              style: GoogleFonts.poppins(
                  fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              'Sign in to Your Account',
              style: GoogleFonts.rubik(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            EmailAuthScreen(
              formkey: _formkey,
            ),
            SizedBox(
              height: 16,
            ),
            BlocBuilder<GoogleAuthBloc, GoogleAuthState>(
                builder: (context, state) {
              if (state is GoogleAuthenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customNavRemoveuntil(context, BottomNavigation());
                });
              } else if (state is GoogleAuthLoading) {
                Google = true;
              } else if (state is GoogleAuthError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(state.message.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    BlocProvider.of<GoogleAuthBloc>(context)
                                        .add(Googleinitial());
                                  },
                                  child: Text('ok'))
                            ]);
                      });
                });
              } else if (state is GoogleAuthInitial) {
                Google = false;
              }
              return CustomGoogleButton(google: Google);
            }),
            SizedBox(
              height: 15,
            ),
            CustomPhoneButton(),
            SizedBox(
              height: 24,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Dont\'t have account?Let\'s',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
              TextButton(
                  onPressed: () {
                    customNavRemoveuntil(context, SignUp());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 1, 10, 174)),
                  ))
            ])
          ]));
    });
  }
}
