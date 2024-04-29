// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
// import 'package:quick_glimpse/presentation/screens/random_profile/random.dart';
// import 'package:quick_glimpse/presentation/widgets/button.dart';
// import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';

// class ViewPostScreen extends StatelessWidget {
//   ViewPostScreen({required this.state, super.key});
//   dynamic state;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Expanded(
//           child: Column(children: [
//                   Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20)),
//                       ),
//                       child: ListTile(
//                         onTap: () {
//                           customNavPush(
//                               context,
//                               RandomProfile(
//                                 username: state.post.username,
//                                 uid: state.post[index].uid,
//                               ));
//                           BlocProvider.of<RandomProfileBloc>(context)
//                               .add(GetRandomUser(email: state.post[index].uid));
//                         },
//                         leading: CircleAvatar(
//                           backgroundImage:
//                               NetworkImage(state.post[index].userImage),
//                           radius: 24,
//                         ),
//                         title: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 state.post[index].username,
//                                 style: GoogleFonts.rubik(
//                                     fontSize: 16, fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 state.post[index].time,
//                                 style: TextStyle(fontSize: 10),
//                               )
//                             ]),
//                         trailing: Padding(
//                             padding: const EdgeInsets.only(
//                                 right: 9, top: 5, bottom: 0),
//                             child: customButton(
//                               isRow: false,
//                               borderclr: Colors.transparent,
//                               color: Colors.black,
//                               height: 30,
//                               width: 70,
//                               name: 'Follow',
//                               textclr: Colors.white,
//                               textsize: 13,
//                               radius: 20,
//                             )),
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           left: 30, right: 30, top: 8, bottom: 5),
//                       child: Container(
//                         clipBehavior: Clip.antiAlias,
//                         width: double.infinity,
//                         child: Image.network(
//                           state.post[index].image,
//                           fit: BoxFit.cover,
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20)),
//                       )),
//                   Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.favorite_border_rounded,
//                             size: 30,
//                           )),
//                       SizedBox(
//                           width: 300, child: Text(state.post[index].caption))
//                     ],
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(
//                           top: 2, bottom: 10, left: 60, right: 60),
//                       child: Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                       ))
//                 ]);
            
//         ),
//       ),
//     );
//   }
// }
