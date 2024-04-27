// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RandomShimmerGridView extends StatelessWidget {
  const RandomShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 5.0, // Spacing between columns
              mainAxisSpacing: 5.0, // Spacing between rows
            ),
            itemBuilder: (context, index) {
              return GridTile(
                  child: Container(
                color: Colors.black,
              ));
            }));
  }
}
