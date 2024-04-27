import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_in.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                customNavRemoveuntil(context, SignIn());
              }
            },
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignoutEvent());
                },
                icon: Icon(Icons.logout)),
          )
        ],
        title: Text('Profile'),
      ),
    );
  }
}
