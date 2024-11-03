import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyAgJhVKnTNvC6d0HbndDBTyT5A457pwHhc",
    authDomain: "gemini-46e3d.firebaseapp.com",
    projectId: "gemini-46e3d",
    storageBucket: "gemini-46e3d.firebasestorage.app",
    messagingSenderId: "159136412159",
    appId: "1:159136412159:web:65e7ff34e99628e46a37ca");

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: firebaseConfig);
  runApp(App());
}
