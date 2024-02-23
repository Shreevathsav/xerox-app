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
    apiKey: 'AIzaSyApGYalXkL_ECgQWtd_9uFVbfBUEL45_ek',
    appId: '1:374972235161:web:1e5be44aaabdc2e026a708',
    messagingSenderId: '374972235161',
    projectId: 'xerox-app-e3b49',
    authDomain: 'xerox-app-e3b49.firebaseapp.com',
    storageBucket: 'xerox-app-e3b49.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbFyy3z6wQZKW588tQ1lteqvTMPZXgQxA',
    appId: '1:374972235161:android:72f8c0a11cba957626a708',
    messagingSenderId: '374972235161',
    projectId: 'xerox-app-e3b49',
    storageBucket: 'xerox-app-e3b49.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDafoQ04IBS0C1hoDANhdSk9bRw91y6zpo',
    appId: '1:374972235161:ios:6a423cdfb2b6a33926a708',
    messagingSenderId: '374972235161',
    projectId: 'xerox-app-e3b49',
    storageBucket: 'xerox-app-e3b49.appspot.com',
    iosBundleId: 'com.example.xeroxApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDafoQ04IBS0C1hoDANhdSk9bRw91y6zpo',
    appId: '1:374972235161:ios:de55c576c17f39c226a708',
    messagingSenderId: '374972235161',
    projectId: 'xerox-app-e3b49',
    storageBucket: 'xerox-app-e3b49.appspot.com',
    iosBundleId: 'com.example.xeroxApp.RunnerTests',
  );
}
