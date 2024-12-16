import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBIYVqhcSr3u6dgKTpYnrV-nEMcB8KCMFQ",
            authDomain: "luz-da-vida-iym9jw.firebaseapp.com",
            projectId: "luz-da-vida-iym9jw",
            storageBucket: "luz-da-vida-iym9jw.appspot.com",
            messagingSenderId: "481270311970",
            appId: "1:481270311970:web:f10f7686e22b77f1b02e7b"));
  } else {
    await Firebase.initializeApp();
  }
}
