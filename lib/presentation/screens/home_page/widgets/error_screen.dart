// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';

class HomeError extends StatelessWidget {
  HomeError({super.key, required this.state});
  TimelineErrorState state;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () =>
            BlocProvider.of<TimelineBloc>(context).add(TimelineShowEvent()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
                height: 400,
                'assets/images/Duck Waddling Sticker - Duck Waddling - Discover & Share GIFs.gif'),
            SizedBox(
              height: 12,
            ),
            Text(
              'Tap to Reload',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
