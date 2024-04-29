// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/appbar.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/timelines.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TimelineBloc>(context).add(TimelineShowEvent());
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 105, 171, 209),
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60), child: HomeAppBar()),
        body: SingleChildScrollView(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.black,
            onRefresh: () async {
              BlocProvider.of<TimelineBloc>(context).add(TimelineShowEvent());
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 18, top: 8),
                  child: Text(
                    'Timeline',
                    style: GoogleFonts.rubik(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5.0), child: CustomTimelines())
            ]),
          ),
        ));
  }
}
