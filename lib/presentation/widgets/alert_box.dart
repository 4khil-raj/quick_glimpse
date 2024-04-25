import 'package:flutter/material.dart';

void alerts(context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: Text(msg), actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('ok'))
        ]);
      });
}
