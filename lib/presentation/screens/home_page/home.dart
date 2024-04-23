import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/appbar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60), child: HomeAppBar()));
  }
}
