// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/presentation/screens/view_post/view_post.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

class SavedPostProfile extends StatelessWidget {
  SavedPostProfile({required this.isUser, required this.state, super.key});
  UserFoundSuccessState state;
  bool isUser;
  @override
  Widget build(BuildContext context) {
    return state.saved!.isNotEmpty
        ? GridView.builder(
            itemCount: state.saved!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customNavPush(
                        context,
                        ViewPostScreen(
                          isUser: isUser,
                          index: index,
                          state: state,
                        ));
                  });
                },
                child: GridTile(
                    child: Image.network(
                  state.saved![index].image,
                  fit: BoxFit.cover,
                )),
              );
            })
        : InkWell(
            onTap: () {
              BlocProvider.of<RandomProfileBloc>(context)
                  .add(GetRandomUser(email: users!.uid!));
            },
            child: const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      height: 250,
                      image: AssetImage(
                        'assets/images/Duck Waddling Sticker - Duck Waddling - Discover & Share GIFs.gif',
                      )),
                  Text('   No data Found!!!')
                ],
              ),
            ),
          );
  }
}
