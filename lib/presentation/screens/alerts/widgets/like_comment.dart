import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/alerts_bloc/alerts_bloc.dart';
import 'package:quick_glimpse/application/follow_bloc/follow_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class AlertLikeComments extends StatelessWidget {
  const AlertLikeComments({required this.state, super.key});
  final AlertsSuccessState state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: state.likecomment.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    BlocProvider.of<FollowBloc>(context)
                        .add(CheckFollowEvent());
                    customNavPush(
                        context,
                        RandomProfile(
                          username: state.likecomment[index].username,
                          uid: state.likecomment[index].useruId,
                        ));
                    BlocProvider.of<RandomProfileBloc>(context).add(
                        GetRandomUser(email: state.likecomment[index].useruId));
                  },
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(state.likecomment[index].userdp),
                      ),
                      title: Text(state.likecomment[index].alert,
                          style: const TextStyle(fontSize: 13.7)),
                      trailing: Container(
                        height: 50,
                        width: 45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  state.likecomment[index].image,
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      )));
            }));
  }
}
