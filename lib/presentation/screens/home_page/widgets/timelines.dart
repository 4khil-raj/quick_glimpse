// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/error_screen.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/listview_builder.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/shimmer.dart';

class CustomTimelines extends StatelessWidget {
  const CustomTimelines({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineBloc, TimelineState>(
      builder: (context, state) {
        if (state is TimelineErrorState) {
          return HomeError(state: state);
        } else if (state is TimeLineLoadSuccessState) {
          return TimelineBuilder(state: state);
        }
        return HomeShimmer();
      },
    );
  }
}
