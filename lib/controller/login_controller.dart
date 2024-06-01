// ignore_for_file: use_build_context_synchronously, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/login_view.dart';
import 'package:mais_saude/view/pages/home_application_view.dart';

class LoginController {
  String email = "", password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  userLoginLocal(BuildContext context) async {
    //método de login utilizando email e senha
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeApplication()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //tratando erro "usuário não encontrado"
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Nenhum usuário encontrado",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        //tratando erro "senha incorreta"
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
    //metodo de login utilizando autenticação com o google
    try {
      final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeApplication()));
    } catch (e) {
      print("erro:");
      print(e);
    }
  }

  userLogout(BuildContext context) async {
    //metodo de logout
    _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
