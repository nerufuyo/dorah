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
    apiKey: 'AIzaSyCIAdgfV3cdEo3j-ArLqTj9UrHVwFCygoA',
    appId: '1:96119526691:web:ed8412a08c688e2319e896',
    messagingSenderId: '96119526691',
    projectId: 'dorah-fa7a5',
    authDomain: 'dorah-fa7a5.firebaseapp.com',
    storageBucket: 'dorah-fa7a5.appspot.com',
    measurementId: 'G-KZSZGSPCX4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMBXyLMS3zgpiyqKGOOzvA2AhADIvHw_w',
    appId: '1:96119526691:android:9f72c5ae25a2a02d19e896',
    messagingSenderId: '96119526691',
    projectId: 'dorah-fa7a5',
    storageBucket: 'dorah-fa7a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5aGdItCbOwjH_4Ihwx7q0YK2ANmbiaas',
    appId: '1:96119526691:ios:f8339ab29238835019e896',
    messagingSenderId: '96119526691',
    projectId: 'dorah-fa7a5',
    storageBucket: 'dorah-fa7a5.appspot.com',
    iosBundleId: 'com.example.dorah',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5aGdItCbOwjH_4Ihwx7q0YK2ANmbiaas',
    appId: '1:96119526691:ios:d9ef75c16f17b03b19e896',
    messagingSenderId: '96119526691',
    projectId: 'dorah-fa7a5',
    storageBucket: 'dorah-fa7a5.appspot.com',
    iosBundleId: 'com.example.dorah.RunnerTests',
  );
}