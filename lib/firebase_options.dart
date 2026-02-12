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
    apiKey: 'AIzaSyBIp9RWzxA0VZsYByudrVSZUSOrs7kng0k',
    appId: '1:1016201519964:web:bfc2c46862fcb0b9319799',
    messagingSenderId: '1016201519964',
    projectId: 'horizon-task-11766',
    authDomain: 'horizon-task-11766.firebaseapp.com',
    storageBucket: 'horizon-task-11766.firebasestorage.app',
    measurementId: 'G-4QM5J86X1F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbUYGkN250UxA7xpW0gDS-dqtT36F27H4',
    appId: '1:1016201519964:android:ee2a776fb04ae3eb319799',
    messagingSenderId: '1016201519964',
    projectId: 'horizon-task-11766',
    storageBucket: 'horizon-task-11766.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK8D-coL2qOa1aGB4HVnGp6VL626INrWs',
    appId: '1:1016201519964:ios:a86b7ad4fb7040a7319799',
    messagingSenderId: '1016201519964',
    projectId: 'horizon-task-11766',
    storageBucket: 'horizon-task-11766.firebasestorage.app',
    iosBundleId: 'com.example.adminDashboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBK8D-coL2qOa1aGB4HVnGp6VL626INrWs',
    appId: '1:1016201519964:ios:a86b7ad4fb7040a7319799',
    messagingSenderId: '1016201519964',
    projectId: 'horizon-task-11766',
    storageBucket: 'horizon-task-11766.firebasestorage.app',
    iosBundleId: 'com.example.adminDashboard',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBIp9RWzxA0VZsYByudrVSZUSOrs7kng0k',
    appId: '1:1016201519964:web:64c7e38d36b1a55e319799',
    messagingSenderId: '1016201519964',
    projectId: 'horizon-task-11766',
    authDomain: 'horizon-task-11766.firebaseapp.com',
    storageBucket: 'horizon-task-11766.firebasestorage.app',
    measurementId: 'G-DFGQ3KX8MZ',
  );
}
