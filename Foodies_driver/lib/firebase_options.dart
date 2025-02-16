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
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAg7yW52Hnaalx6fwExz6U8Emko5WFN5AE',
    appId: '1:595686676766:android:1b4ea0736a8f8d17c2510f',
    messagingSenderId: '595686676766',
    projectId: 'qwik-chow',
    databaseURL: 'https://qwik-chow-default-rtdb.firebaseio.com',
    storageBucket: 'qwik-chow.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgOAjFKOb5OXLxQq56qpIMSlak65HbCb8',
    appId: '1:595686676766:ios:704888b519f85a26c2510f',
    messagingSenderId: '595686676766',
    projectId: 'qwik-chow',
    databaseURL: 'https://qwik-chow-default-rtdb.firebaseio.com',
    storageBucket: 'qwik-chow.appspot.com',
    iosClientId: '595686676766-nllk475k9nakhsm7885p14i1i451qd7f.apps.googleusercontent.com',
    iosBundleId: 'com.foodies.driver.ios',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD6SYvSqsQoRsBOS0M7DwNDVIyNW8FvGyA',
    appId: '1:595686676766:web:41a48fd9b5f93d39c2510f',
    messagingSenderId: '595686676766',
    projectId: 'qwik-chow',
    authDomain: 'qwik-chow.firebaseapp.com',
    databaseURL: 'https://qwik-chow-default-rtdb.firebaseio.com',
    storageBucket: 'qwik-chow.appspot.com',
    measurementId: 'G-RRE3DXSTZW',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgOAjFKOb5OXLxQq56qpIMSlak65HbCb8',
    appId: '1:595686676766:ios:0eadebad89fb7d6dc2510f',
    messagingSenderId: '595686676766',
    projectId: 'qwik-chow',
    databaseURL: 'https://qwik-chow-default-rtdb.firebaseio.com',
    storageBucket: 'qwik-chow.appspot.com',
    iosClientId: '595686676766-4btrqekdhgfphuphuhitkimuqsg2n3mo.apps.googleusercontent.com',
    iosBundleId: 'com.foodies.driver.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDDVKy8Lv0nUpnAZsr52FIL_JL6OD76ZGc',
    appId: '1:595686676766:web:684c678c71eeb1a0c2510f',
    messagingSenderId: '595686676766',
    projectId: 'qwik-chow',
    authDomain: 'qwik-chow.firebaseapp.com',
    databaseURL: 'https://qwik-chow-default-rtdb.firebaseio.com',
    storageBucket: 'qwik-chow.appspot.com',
    measurementId: 'G-4E6TDJK6R9',
  );

}