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
    apiKey: 'AIzaSyBkR6bzQ0QErFlWNxvp8Dlu8w4ZBvmn9hA',
    appId: '1:524107559313:web:27cd94f37326dbe131aa30',
    messagingSenderId: '524107559313',
    projectId: 'finalpro-mobile',
    authDomain: 'finalpro-mobile.firebaseapp.com',
    storageBucket: 'finalpro-mobile.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvPpaePMoA0VLGSBO-qFUPBZnT6J-8tZc',
    appId: '1:524107559313:android:0b4733114205905431aa30',
    messagingSenderId: '524107559313',
    projectId: 'finalpro-mobile',
    storageBucket: 'finalpro-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCH4l0AVWIWkK7c5Ehq9Jj-G3LYu7BpK5U',
    appId: '1:524107559313:ios:76d96cf5fe5c87b431aa30',
    messagingSenderId: '524107559313',
    projectId: 'finalpro-mobile',
    storageBucket: 'finalpro-mobile.appspot.com',
    iosClientId: '524107559313-ckicg6v4c6o7k47klki26hbtu61imf82.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalproMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCH4l0AVWIWkK7c5Ehq9Jj-G3LYu7BpK5U',
    appId: '1:524107559313:ios:76d96cf5fe5c87b431aa30',
    messagingSenderId: '524107559313',
    projectId: 'finalpro-mobile',
    storageBucket: 'finalpro-mobile.appspot.com',
    iosClientId: '524107559313-ckicg6v4c6o7k47klki26hbtu61imf82.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalproMobile',
  );
}
