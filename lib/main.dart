import 'package:flutter/material.dart';
import 'package:quick_glimpse/application/auth_bloc/auth_bloc.dart';
import 'package:quick_glimpse/application/google_auth/google_auth_bloc.dart';
import 'package:quick_glimpse/application/otp_bloc/otp_bloc.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckLoginStatusEvent()),
        ),
        BlocProvider(
          create: (context) => GoogleAuthBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => OtpBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
