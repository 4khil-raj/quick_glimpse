// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(),
                    title: Text('loading'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      height: 250,
                      // width: 200,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 20,
                      ),
                      Text('loading....')
                    ],
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
