// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/presentation/screens/home_page/widgets/error_screen.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_gridview.dart';
import 'package:quick_glimpse/presentation/screens/search/widgets/explore.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search',
              style: GoogleFonts.rubik(fontWeight: FontWeight.w600)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomTextFormField(
                  hintText: 'Find others', controller: searchController),
              const SizedBox(
                height: 12,
              ),
              Row(children: [
                const Icon(Icons.explore_outlined),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Explore',
                  style: GoogleFonts.poppins(fontSize: 18),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<TimelineBloc, TimelineState>(
                  builder: (context, state) {
                if (state is TimeLineLoadSuccessState) {
                  return Expanded(
                      child: ExploreGridView(
                    state: state,
                  ));
                } else if (state is TimelineErrorState) {
                  return HomeError(state: state);
                }
                return Expanded(
                  child: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 136, 134, 134),
                    highlightColor: const Color.fromARGB(255, 255, 255, 255),
                    child: const RandomShimmerGridView(),
                  ),
                );
              })
            ])));
  }
}
