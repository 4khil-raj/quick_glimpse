// ignore_for_file: prefer_const_constructors

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/domain/models/timeline/model.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class CustomTimelines extends StatelessWidget {
  const CustomTimelines({super.key});

  @override
  Widget build(BuildContext context) {
    // List<TimelineModel> timeline;
    return BlocBuilder<TimelineBloc, TimelineState>(
      builder: (context, state) {
        if (state is TimeLineLoadSuccessState) {
          return SizedBox(
            height: 700,
            child: ListView.builder(
                itemCount: state.timeline.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            border: Border.all()),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(state.timeline[index].userImage),
                            radius: 24,
                          ),
                          title: Text(state.timeline[index].username),
                          trailing: Padding(
                              padding: const EdgeInsets.only(
                                  right: 9, top: 5, bottom: 0),
                              child: customButton(
                                isRow: false,
                                borderclr: Colors.transparent,
                                color: Colors.black,
                                height: 30,
                                width: 70,
                                name: 'Follow',
                                textclr: Colors.white,
                                textsize: 13,
                                radius: 20,
                              )),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Image.network(
                          state.timeline[index].image,
                          fit: BoxFit.cover,
                        ),
                        height: 350,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          // image: DecorationImage(
                          //     image: Image.network(
                          //       state.timeline[index].image,
                          //     ),
                          //     // fit: BoxFit.fill,
                          //     filterQuality: FilterQuality.high)
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.favorite)),
                          SizedBox(
                              width: 300,
                              child: Text(state.timeline[index].caption))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 28, left: 50, right: 50),
                        child: Divider(
                          thickness: 2,
                        ),
                      )
                    ],
                  );
                }),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
