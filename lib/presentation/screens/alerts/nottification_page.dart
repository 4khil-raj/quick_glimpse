// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/alerts_bloc/alerts_bloc.dart';
import 'package:quick_glimpse/presentation/screens/alerts/widgets/followers_grid.dart';
import 'package:quick_glimpse/presentation/screens/alerts/widgets/like_comment.dart';

class NottificationPage extends StatelessWidget {
  const NottificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AlertsBloc>(context).add(AlertRequstEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
      ),
      body: BlocBuilder<AlertsBloc, AlertsState>(
        builder: (context, state) {
          if (state is AlertsSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.follower.isEmpty
                    ? SizedBox()
                    : AlertsFollowersGridView(state: state),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Intractions',
                    style: GoogleFonts.rubik(fontSize: 14),
                  ),
                ),
                AlertLikeComments(
                  state: state,
                )
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
