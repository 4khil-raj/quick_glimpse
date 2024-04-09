import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/core/route/custom_navigator.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final auth = BlocProvider.of<AuthBloc>(context);
                auth.add(SignoutEvent());
                customNavRemoveuntil(context, const SignIn());
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
