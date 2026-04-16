import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCy8QJJgJ5qqJiALmuLZo_ukuE68-TpFa4",
            authDomain: "clearfund-dev.firebaseapp.com",
            projectId: "clearfund-dev",
            storageBucket: "clearfund-dev.firebasestorage.app",
            messagingSenderId: "107288991502",
            appId: "1:107288991502:web:61d5a9875d0adf3a1be95f",
            measurementId: "G-M3M5LCT6YJ"));
  } else {
    await Firebase.initializeApp();
  }
}
