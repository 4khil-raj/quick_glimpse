import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/presentation/screens/authentication/sign_in.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              customNavRemoveuntil(context, const SignIn());
            }
          },
          child: IconButton(
              onPressed: () {
                alertsWithButtons(context, 'Do you want to LogOut..?', () {
                  BlocProvider.of<AuthBloc>(context).add(SignoutEvent());
                });
              },
              icon: const Icon(Icons.logout)),
        )
      ],
      title: Text(users!.email!),
    );
  }
}
