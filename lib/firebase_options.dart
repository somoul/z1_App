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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCmG8Ds8ybiWx8Ork2eex99C_A9tVvoyKs',
    appId: '1:891297600601:web:2deec1ab1852b9dec58d48',
    messagingSenderId: '891297600601',
    projectId: 'z1-app-a10ff',
    authDomain: 'z1-app-a10ff.firebaseapp.com',
    storageBucket: 'z1-app-a10ff.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC1b8FIbue50TOYp2gWs73_YT2sVYD8Bs',
    appId: '1:891297600601:android:dbb95d5fdb089adcc58d48',
    messagingSenderId: '891297600601',
    projectId: 'z1-app-a10ff',
    storageBucket: 'z1-app-a10ff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwyfF4YsiApd1hXUWtLGXd-C5B0vy_wlU',
    appId: '1:891297600601:ios:36dd3e0fcbd462ffc58d48',
    messagingSenderId: '891297600601',
    projectId: 'z1-app-a10ff',
    storageBucket: 'z1-app-a10ff.appspot.com',
    iosClientId: '891297600601-kqrjchc4nhjchft7ud981il1god0fr41.apps.googleusercontent.com',
    iosBundleId: 'com.example.z1App',
  );
}
