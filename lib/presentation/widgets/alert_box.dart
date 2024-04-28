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

void alertsWithButtons(context, String msg, Function function) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('No')),
          TextButton(
              onPressed: () {
                function();
              },
              child: const Text('Yes'))
        ],
      );
    },
  );
}
