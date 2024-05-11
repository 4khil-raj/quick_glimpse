import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/infrastructure/repository/messages/repo.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({required this.receiverID, required this.receiverEmail, super.key});
  final messageController = TextEditingController();
  final ChatRepo chatRepo = ChatRepo();

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatRepo.sendMessage(receiverID, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [Expanded(child: buildMessageList()), buildUserInput()],
      ),
    );
  }

  Widget buildMessageList() {
    return StreamBuilder(
      stream: ChatRepo().getMessages(receiverID, users?.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => buildMessageItems(doc)).toList(),
        );
      },
    );
  }

  Widget buildMessageItems(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == users?.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(data['message']),
          ],
        ));
  }

  Widget buildUserInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Type message',
              controller: messageController,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
