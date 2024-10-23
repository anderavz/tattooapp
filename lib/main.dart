//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:myapp/firebase_options.dart';

import 'app.dart'; //chamei para sanar o erro

// https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=ios

void main() {
//  WidgetsFlutterBinding.ensureInitialized();//aguarda o flutter carregar a apliacação p depois conectar ao firebase
//  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);//nao esquecer do imports la em cima 
  runApp(App());
}
//vamo ve se vai