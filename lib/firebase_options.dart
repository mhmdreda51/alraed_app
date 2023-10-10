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
    apiKey: 'AIzaSyAdrCA916-3IR5uaxUsWrQngq_JaGc7AmY',
    appId: '1:811933956641:web:76a07f0b8d097c739d4160',
    messagingSenderId: '811933956641',
    projectId: 'alraed-64db3',
    authDomain: 'alraed-64db3.firebaseapp.com',
    storageBucket: 'alraed-64db3.appspot.com',
    measurementId: 'G-023588JF0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAF3zLsX91FmvegNwJkmc0Dma2yqJydMKU',
    appId: '1:811933956641:android:8a25d35ff86700249d4160',
    messagingSenderId: '811933956641',
    projectId: 'alraed-64db3',
    storageBucket: 'alraed-64db3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0dKwJtBAzXXuzSqoaAOFcBvmBk43eDeM',
    appId: '1:811933956641:ios:0bfbd1927fc7ed579d4160',
    messagingSenderId: '811933956641',
    projectId: 'alraed-64db3',
    storageBucket: 'alraed-64db3.appspot.com',
    iosBundleId: 'com.alradiApp.mhmd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0dKwJtBAzXXuzSqoaAOFcBvmBk43eDeM',
    appId: '1:811933956641:ios:639af7e9389da25e9d4160',
    messagingSenderId: '811933956641',
    projectId: 'alraed-64db3',
    storageBucket: 'alraed-64db3.appspot.com',
    iosBundleId: 'com.alradiApp.mhmd.RunnerTests',
  );
}
