import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quick_glimpse/presentation/screens/gemini_ai/gemini.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

ValueNotifier<bool> scroll = ValueNotifier(false);

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 105, 171, 209),
              toolbarHeight: 250,
              title: Text('Chats'),
              bottom: PreferredSize(
                  preferredSize: Size.fromRadius(20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: ValueListenableBuilder(
                        valueListenable: scroll,
                        builder: (context, isvisible, _) {
                          return isvisible
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Container(
                                      height: 50,
                                      child: CustomTextFormField(
                                          hintText: '    Search',
                                          controller: searchController)),
                                )
                              : SizedBox();
                        }),
                  )),
            ),
          ),
        ),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scroll.value = false;
            } else if (direction == ScrollDirection.forward) {
              scroll.value = true;
            }
            return true;
          },
          child: Column(
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
                // height: 1000,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 500,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
