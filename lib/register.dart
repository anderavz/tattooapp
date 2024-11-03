import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var namecontroller = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(namecontroller.text);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw FirebaseAuthException(
            code: 'email-already-in-use', message: 'Email já em uso');
      } else {
        throw FirebaseAuthException(
            code: e.code, message: e.message ?? "Unknown error occurred.");
      }
    } catch (e) {
      throw Exception("Erro interno");
    }
  }

  void createAccount(BuildContext context) async {
    try {
      var user = await signUp(emailController.text, passwordController.text);

      if (user != null) Navigator.pushReplacementNamed(context, '/scan');
    } on FirebaseAuthException catch (ex) {
      var errorMessage = ex.message ?? "An unexpected error occurred.";
      var snackBar = SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (ex) {
      var snackBar = const SnackBar(
        content: Text("An unexpected error occurred. Please try again."),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CADASTRO'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: 'NOME COMPLETO',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'LOGIN',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'SENHA',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'CONFIRMAR SENHA',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('CADASTRAR'),
                onPressed: () => createAccount(context)),
          ],
        ),
      ),
    );
  }
}
