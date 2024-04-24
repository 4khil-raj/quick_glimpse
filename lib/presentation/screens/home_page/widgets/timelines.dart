// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';

class CustomTimelines extends StatelessWidget {
  const CustomTimelines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      topStart: Radius.circular(20))),
              child: Column(children: [
                Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 9, top: 5, right: 10, bottom: 0),
                      child: CircleAvatar(
                        radius: 24,
                      )),
                  Text('username'),
                  Spacer(),
                  Padding(
                      padding:
                          const EdgeInsets.only(right: 9, top: 5, bottom: 0),
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
                      ))
                ]),
                const Divider(
                  thickness: 2,
                )
              ])),
          Row(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                )),
            Text('data'),
          ]),
          const Padding(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 13),
              child: Divider(
                thickness: 2,
              ))
        ]),
      ],
    );
  }
}
