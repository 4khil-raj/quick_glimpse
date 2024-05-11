import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/infrastructure/repository/messages/repo.dart';
import 'package:quick_glimpse/presentation/screens/chat_screen/widgets/chat_page.dart';
import 'package:quick_glimpse/presentation/screens/chat_screen/widgets/user_tile.dart';
import 'package:quick_glimpse/presentation/screens/gemini_ai/gemini.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

ValueNotifier<bool> scroll = ValueNotifier(false);

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Column(
        children: [
          ListTile(
            trailing: Icon(Icons.push_pin_sharp),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/ai-technology-microchip-background-vector-digital-transformation-concept_53876-112222.jpg?size=338&ext=jpg&ga=GA1.1.1369675164.1715299200&semt=ais'),
            ),
            title: Text('Ai Friend'),
            onTap: () {
              customNavPush(context, GeminiFriend());
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: ChatRepo().getUsersStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('loading');
                }

                return ListView(
                  children: snapshot.data!
                      .map<Widget>(
                          (userData) => _buildUserListItem(userData, context))
                      .toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  if (userData['email'] != users?.email) {
    return UserTile(
      text: userData['email'],
      onTap: () {
        customNavPush(
            context,
            ChatPage(
              receiverID: userData['uid'],
              receiverEmail: userData['email'],
            ));
      },
    );
  } else {
    return const SizedBox();
  }
}
