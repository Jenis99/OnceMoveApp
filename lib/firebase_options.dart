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
    apiKey: 'AIzaSyDepLYA8fvUURlOj0zHblyFkFbEryq8sIw',
    appId: '1:366951219724:web:802402f6227cb9e8752429',
    messagingSenderId: '366951219724',
    projectId: 'oncemove-14ef2',
    authDomain: 'oncemove-14ef2.firebaseapp.com',
    storageBucket: 'oncemove-14ef2.appspot.com',
    measurementId: 'G-L233NHWFLY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyZdU3L5XUegdcXnubxZZQ8Pl9MLCMHvo',
    appId: '1:366951219724:android:075fc89e1c2a354a752429',
    messagingSenderId: '366951219724',
    projectId: 'oncemove-14ef2',
    storageBucket: 'oncemove-14ef2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0fzpoXVCmxGpDUEkT_DcZ_rkesmvtWIQ',
    appId: '1:366951219724:ios:c76a3884f9e96b90752429',
    messagingSenderId: '366951219724',
    projectId: 'oncemove-14ef2',
    storageBucket: 'oncemove-14ef2.appspot.com',
    iosClientId: '366951219724-vikpdbojer2laqb8pr15gdlr5eh1r562.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );
}
