import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "GOOGLE_API_KEY_REDACTED",
            authDomain: "brew-perks-9dvs9l.firebaseapp.com",
            projectId: "brew-perks-9dvs9l",
            storageBucket: "brew-perks-9dvs9l.appspot.com",
            messagingSenderId: "1086464274910",
            appId: "1:1086464274910:web:b2dc92c4a4de1f92836d4f"));
  } else {
    await Firebase.initializeApp();
  }
}
