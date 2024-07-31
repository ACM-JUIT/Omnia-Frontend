// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCwc5DhfWg2W1mCQY0aXl1kJ6kU_S5gvbs',
    appId: '1:755876834223:web:1cd09cd55ea1c98e521d5a',
    messagingSenderId: '755876834223',
    projectId: 'omnia-acm',
    authDomain: 'omnia-acm.firebaseapp.com',
    storageBucket: 'omnia-acm.appspot.com',
    measurementId: 'G-NXNNBZ5D6S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUsh9vYt1zcs3oIgozKIV4LlSgCKp5F40',
    appId: '1:755876834223:android:eb24e69536bb2ce1521d5a',
    messagingSenderId: '755876834223',
    projectId: 'omnia-acm',
    storageBucket: 'omnia-acm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkUCC9PCnoqEeXrcLsysZO-Y4xqN9XuW0',
    appId: '1:755876834223:ios:fb3c33ec8a83410e521d5a',
    messagingSenderId: '755876834223',
    projectId: 'omnia-acm',
    storageBucket: 'omnia-acm.appspot.com',
    androidClientId: '755876834223-n5s5uvrtskul4rg301lq6ljmhss2n2tg.apps.googleusercontent.com',
    iosClientId: '755876834223-ntjtp3duunj9igbkuv16nlkm72v8num0.apps.googleusercontent.com',
    iosBundleId: 'com.example.omnia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkUCC9PCnoqEeXrcLsysZO-Y4xqN9XuW0',
    appId: '1:755876834223:ios:fb3c33ec8a83410e521d5a',
    messagingSenderId: '755876834223',
    projectId: 'omnia-acm',
    storageBucket: 'omnia-acm.appspot.com',
    androidClientId: '755876834223-n5s5uvrtskul4rg301lq6ljmhss2n2tg.apps.googleusercontent.com',
    iosClientId: '755876834223-ntjtp3duunj9igbkuv16nlkm72v8num0.apps.googleusercontent.com',
    iosBundleId: 'com.example.omnia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwc5DhfWg2W1mCQY0aXl1kJ6kU_S5gvbs',
    appId: '1:755876834223:web:1030495ecc00b75a521d5a',
    messagingSenderId: '755876834223',
    projectId: 'omnia-acm',
    authDomain: 'omnia-acm.firebaseapp.com',
    storageBucket: 'omnia-acm.appspot.com',
    measurementId: 'G-K9HVTFZ8G0',
  );
}