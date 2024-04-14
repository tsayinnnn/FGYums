import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBlBcjhRk4srwWgOY_sSy9N8UGPUHzBSZM",
            authDomain: "fg---nenet-s-kitchen.firebaseapp.com",
            projectId: "fg---nenet-s-kitchen",
            storageBucket: "fg---nenet-s-kitchen.appspot.com",
            messagingSenderId: "355044725132",
            appId: "1:355044725132:web:8a3c44af39fd3b036506a9",
            measurementId: "G-MXTCWM4VXN"));
  } else {
    await Firebase.initializeApp();
  }
}
