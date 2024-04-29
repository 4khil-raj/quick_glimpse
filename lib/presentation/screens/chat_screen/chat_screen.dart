import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          child: SizedBox(
            height: 1000,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  height: 500,
                );
              },
            ),
          ),
        ));
  }
}
