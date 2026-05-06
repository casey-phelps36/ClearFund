import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCtkoWxYRZbv8FvnhQkcD111POOUIZbNsM",
            authDomain: "clear-fund-1km59f.firebaseapp.com",
            projectId: "clear-fund-1km59f",
            storageBucket: "clear-fund-1km59f.firebasestorage.app",
            messagingSenderId: "60648383638",
            appId: "1:60648383638:web:0b2e50844876e53f254eb7",
            measurementId: "G-793G9HN2W1"));
  } else {
    await Firebase.initializeApp();
  }
}
