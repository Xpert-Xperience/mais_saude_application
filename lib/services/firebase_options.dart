import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC-bzUtDWavf3vhnctnujelAYpnpR2C2kc',
    appId: '1:683680419796:web:676ab590b2947c36ac1041',
    messagingSenderId: '683680419796',
    projectId: 'maissaudeapp-9e9ae',
    authDomain: 'maissaudeapp-9e9ae.firebaseapp.com',
    storageBucket: 'maissaudeapp-9e9ae.appspot.com',
    measurementId: 'G-DZ4BQHBXN4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyocFrGODErK_JhLkDKVpOvLGc9YvuBoM',
    appId: '1:683680419796:android:8d036561da7636d9ac1041',
    messagingSenderId: '683680419796',
    projectId: 'maissaudeapp-9e9ae',
    storageBucket: 'maissaudeapp-9e9ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAutVj9enMNkD1YzmySu6x8xvEwCpJlRr8',
    appId: '1:683680419796:ios:fe3245e9ed1452bdac1041',
    messagingSenderId: '683680419796',
    projectId: 'maissaudeapp-9e9ae',
    storageBucket: 'maissaudeapp-9e9ae.appspot.com',
    iosBundleId: 'com.example.maisSaude',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAutVj9enMNkD1YzmySu6x8xvEwCpJlRr8',
    appId: '1:683680419796:ios:0f8a6af5f45dc1deac1041',
    messagingSenderId: '683680419796',
    projectId: 'maissaudeapp-9e9ae',
    storageBucket: 'maissaudeapp-9e9ae.appspot.com',
    iosBundleId: 'com.example.maisSaude.RunnerTests',
  );
}
