import 'package:flutter/material.dart';
import 'package:quick_glimpse/infrastructure/repository/messages/repo.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('username'),
      ),
      body: StreamBuilder(
        stream: ChatRepo().getUsersStream(),
        builder: (context, snapshot) {},
      ),
    );
  }
}
