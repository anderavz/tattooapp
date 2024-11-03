import 'package:flutter/material.dart';
//aqui eu vou importar todas as paginas que eu quero usar no app
import 'login.dart'; //importei a pagina login.dart
import 'register.dart'; //importei a pagina registrer.dart
import 'scan.dart'; //importei a pagina lista.dart'
import 'result.dart'; //importei a pagina details.dart'

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RegisterPage(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/scan': (context) => ScanScreen(),
        '/details': (context) => ResultScreen(),
      },
      initialRoute: '/login',
    );
  }
}
