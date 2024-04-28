// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/widgets/simmer_container.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 136, 134, 134),
        highlightColor: Color.fromARGB(255, 255, 255, 255),
        child: SizedBox(
            height: 1000,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        ListTile(
                          leading: CircleAvatar(),
                          title: Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: ShimmerTextHelper(
                              length: 20,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              height: 250,
                            )),
                        SizedBox(
                          height: 20,
                          width: 10,
                        ),
                        Row(children: const [
                          Icon(Icons.favorite),
                          SizedBox(
                            width: 20,
                          ),
                          ShimmerTextHelper(
                            length: 20,
                            width: 150,
                          ),
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Divider(
                            thickness: 2,
                          ),
                        )
                      ]));
                })));
  }
}
