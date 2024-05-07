import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/alerts_bloc/alerts_bloc.dart';

class AlertLikeComments extends StatelessWidget {
  const AlertLikeComments({required this.state, super.key});
  final AlertsSuccessState state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: state.likecomment.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(state.likecomment[index].userdp),
              ),
              title: Text(state.likecomment[index].alert,
                  style: TextStyle(fontSize: 13.7)),
              trailing: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          state.likecomment[index].image,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16)),
              ),
            );
          }),
    );
  }
}
