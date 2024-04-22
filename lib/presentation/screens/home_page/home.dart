import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Quick Glimpse'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_rounded,
                size: 30,
              ))
        ],
      ),
    );
  }
}
