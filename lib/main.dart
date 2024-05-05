import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/comments/comments_bloc.dart';
import 'package:quick_glimpse/application/edit_delete/edit_delete_bloc.dart';
import 'package:quick_glimpse/application/follow_bloc/follow_bloc.dart';
import 'package:quick_glimpse/application/google_auth/google_auth_bloc.dart';
import 'package:quick_glimpse/application/like_post/like_post_bloc.dart';
import 'package:quick_glimpse/application/otp_bloc/otp_bloc.dart';
import 'package:quick_glimpse/application/post_photo/add_post_bloc.dart';
import 'package:quick_glimpse/application/profile_build/profile_build_bloc.dart';
import 'package:quick_glimpse/application/random_profile/random_profile_bloc.dart';
import 'package:quick_glimpse/application/save_post/save_post_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/infrastructure/repository/google_auth/google_auth.dart';
import 'package:quick_glimpse/presentation/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

bool dark = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FollowBloc(),
          ),
          BlocProvider(
            create: (context) => EditDeleteBloc(),
          ),
          BlocProvider(
            create: (context) => LikePostBloc(),
          ),
          BlocProvider(
            create: (context) => SavePostBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => ProfileBuildBloc(),
          ),
          BlocProvider(
            create: (context) => GoogleAuthBloc(AuthRepository()),
          ),
          BlocProvider(
            create: (context) => OtpBloc(),
          ),
          BlocProvider(
            create: (context) => BottomNavBloc(),
          ),
          BlocProvider(
            create: (context) => AddPostBloc(),
          ),
          BlocProvider(
            create: (context) => TimelineBloc(),
          ),
          BlocProvider(
            create: (context) => RandomProfileBloc(),
          ),
          BlocProvider(
            create: (context) => CommentsBloc(),
          ),
        ],
        child: MaterialApp(
          darkTheme: dark ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          title: 'Quick Glimpse',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
  }
}
