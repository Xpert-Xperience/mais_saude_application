// ignore_for_file: use_build_context_synchronously, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/view/login/login_view.dart';
import 'package:mais_saude/view/principal/principal_view.dart';

class LoginController {
  String email = "", password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  userLogin(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Principal()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Nenhum usuário encontrado",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Senha incorreta",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }

  userGoogleLogin(BuildContext context) async {
    try {
      final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Principal()));
    } catch (e) {
      print("erro:");
      print(e);
    }
  }

  userLogout(BuildContext context) async {
    _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
