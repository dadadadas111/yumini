import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC1fm-8VdrUJlx0avZYogmdjiJjcEkTRp4",
            authDomain: "fir-6ab90.firebaseapp.com",
            projectId: "fir-6ab90",
            storageBucket: "fir-6ab90.appspot.com",
            messagingSenderId: "347042278624",
            appId: "1:347042278624:web:5176667888ed8b429e7485",
            measurementId: "G-B6TTYRWZ59"));
  } else {
    await Firebase.initializeApp();
  }
}
