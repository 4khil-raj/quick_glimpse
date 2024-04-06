import 'package:flutter/material.dart';

void customNavPush(BuildContext context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
