// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/application/google_auth/google_auth_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/authentication/widgets/email_auth.dart';
import 'package:quick_glimpse/presentation/screens/authentication/otp_screen.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_up.dart';
import 'package:quick_glimpse/presentation/screens/home.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class SigninFields extends StatelessWidget {
  SigninFields({
    super.key,
  });
  final _formkey = GlobalKey<FormState>();
  bool Google = false;
  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoading) {
        return Center(
          child: Column(
            children: [
              LoadingAnimationWidget.halfTriangleDot(
                  color: Colors.black, size: 50),
              SizedBox(
                height: 15,
              ),
              Text(
                'Loading',
                style: GoogleFonts.rubik(color: Colors.black, fontSize: 50),
              ),
            ],
          ),
        );
      } else if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          customNavPush(context, HomeScreen());
        });
      } else if (state is AuthError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.message!)));
        });
      }
      return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              auth: auth,
              formkey: _formkey,
            ),
            SizedBox(
              height: 16,
            ),
            BlocBuilder<GoogleAuthBloc, GoogleAuthState>(
                builder: (context, state) {
              if (state is GoogleAuthenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customNavRemoveuntil(context, HomeScreen());
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
                          ],
                        );
                      });
                });
              } else if (state is GoogleAuthInitial) {
                Google = false;
              }

              return Google
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: LoadingAnimationWidget.discreteCircle(
                              secondRingColor: Colors.green,
                              thirdRingColor: Colors.blue,
                              color: Colors.red,
                              size: 32)),
                      width: double.infinity,
                      height: 60,
                    )
                  : customButton(
                      onTap: () =>
                          //AuthRepository()..signInWithGoogle(context: con,
                          context
                              .read<GoogleAuthBloc>()
                              .add(GoogleSigninEvent()),
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
                    );
            }),
            SizedBox(
              height: 15,
            ),
            customButton(
              onTap: () {
                customNavPush(context, UsingPhone());
              },
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
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
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
              ],
            )
          ],
        ),
      );
    });
  }
}
