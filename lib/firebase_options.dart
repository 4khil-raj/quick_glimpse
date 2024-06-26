// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDRVe8GXZNF8YIubAcov-lj-PIS-Dk3Iug',
    appId: '1:246527514842:web:c68191fdb4c2ec6aefede3',
    messagingSenderId: '246527514842',
    projectId: 'quick-glimpes',
    authDomain: 'quick-glimpes.firebaseapp.com',
    storageBucket: 'quick-glimpes.appspot.com',
    measurementId: 'G-YEFRK0VJPQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWaPlUoy0gCKJmejcEbgziWjj36HHNCUY',
    appId: '1:246527514842:android:7f462ccc0c881488efede3',
    messagingSenderId: '246527514842',
    projectId: 'quick-glimpes',
    storageBucket: 'quick-glimpes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCH8sPWXX3gmdwJqKEuGoYCKnPMnaQAHxw',
    appId: '1:246527514842:ios:7bc47ab1157ca513efede3',
    messagingSenderId: '246527514842',
    projectId: 'quick-glimpes',
    storageBucket: 'quick-glimpes.appspot.com',
    iosClientId:
        '246527514842-2ftultnrj2ln73mgsgfhqfsddsh2vr3u.apps.googleusercontent.com',
    iosBundleId: 'com.example.quickGlimpse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCH8sPWXX3gmdwJqKEuGoYCKnPMnaQAHxw',
    appId: '1:246527514842:ios:dacb064d0cea38a1efede3',
    messagingSenderId: '246527514842',
    projectId: 'quick-glimpes',
    storageBucket: 'quick-glimpes.appspot.com',
    iosClientId:
        '246527514842-9dqo181a9ml8notnu00f1r1bk6h8ervf.apps.googleusercontent.com',
    iosBundleId: 'com.example.quickGlimpse.RunnerTests',
  );
}
