import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mais_saude/view/pages/home_application_view.dart';
import 'package:mais_saude/view/pages/login_view.dart';

class LoginController {
  String email = "", password = "";
  bool isPasswordObscured = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  Future<void> userLoginLocal(BuildContext context) async {
    try {
      // Tenta realizar o login com email e senha
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      if (user != null) {
        // Se o login foi bem-sucedido, navega para a próxima tela e remove a tela de login da pilha
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeApplication()),
          (Route<dynamic> route) => false,
        );

   
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Nenhum usuário encontrado",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Senha incorreta",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      }
    }
  }

 
  // Método para fazer logout do usuário
  Future<void> userLogout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (Route<dynamic> route) => false,
    );
  }
}
