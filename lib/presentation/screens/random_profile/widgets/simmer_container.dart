import 'package:flutter/material.dart';

class ShimmerTextHelper extends StatelessWidget {
  const ShimmerTextHelper({this.width, required this.length, super.key});
  final double length;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: length,
          width: width,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}
