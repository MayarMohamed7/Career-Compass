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
    apiKey: 'AIzaSyCOL6zaKO2GyiRqE_xxTUTgqPQWHwjz98w',
    appId: '1:276801076629:web:9012359a56aef911dd0a9c',
    messagingSenderId: '276801076629',
    projectId: 'careercompass-e4fef',
    authDomain: 'careercompass-e4fef.firebaseapp.com',
    storageBucket: 'careercompass-e4fef.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwWCujhf-YI5eOKzBkOYiTnvyIdee1j-I',
    appId: '1:276801076629:android:70987e1ed54c7947dd0a9c',
    messagingSenderId: '276801076629',
    projectId: 'careercompass-e4fef',
    storageBucket: 'careercompass-e4fef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkm1vAnmCj1NCyibHBLgEwcy2qUxxEB-s',
    appId: '1:276801076629:ios:05effc97369d2d2add0a9c',
    messagingSenderId: '276801076629',
    projectId: 'careercompass-e4fef',
    storageBucket: 'careercompass-e4fef.appspot.com',
    iosBundleId: 'com.example.graduationinterface',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkm1vAnmCj1NCyibHBLgEwcy2qUxxEB-s',
    appId: '1:276801076629:ios:05effc97369d2d2add0a9c',
    messagingSenderId: '276801076629',
    projectId: 'careercompass-e4fef',
    storageBucket: 'careercompass-e4fef.appspot.com',
    iosBundleId: 'com.example.graduationinterface',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOL6zaKO2GyiRqE_xxTUTgqPQWHwjz98w',
    appId: '1:276801076629:web:3c113267389d70e2dd0a9c',
    messagingSenderId: '276801076629',
    projectId: 'careercompass-e4fef',
    authDomain: 'careercompass-e4fef.firebaseapp.com',
    storageBucket: 'careercompass-e4fef.appspot.com',
  );
}
