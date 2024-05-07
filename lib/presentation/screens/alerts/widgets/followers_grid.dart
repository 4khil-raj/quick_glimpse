import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_glimpse/application/alerts_bloc/alerts_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class AlertsFollowersGridView extends StatelessWidget {
  const AlertsFollowersGridView({required this.state, super.key});
  final AlertsSuccessState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: state.follower.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 160,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(state.follower[index].profile),
                    radius: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(state.follower[index].name,
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  customButton(
                    isRow: false,
                    borderclr: Colors.black,
                    color: Colors.black,
                    height: 25,
                    name: 'Follow Back',
                    onTap: () {},
                    radius: 20,
                    textclr: Colors.white,
                    textsize: 12,
                    width: 100,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
