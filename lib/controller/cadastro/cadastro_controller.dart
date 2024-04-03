// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/view/login/login_view.dart';

class CadastroController {
  String email = "", nome = "", senha = "", confirmarSenha = "";

  TextEditingController matriculaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  registerUser(BuildContext context) async {
    if (nomeController.text != "" && emailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: senha);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Registrado com sucesso!",
                    style: TextStyle(fontSize: 20.0))));

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text(
                    "Senha fraca, tente outra combinação",
                    style: TextStyle(fontSize: 18.0),
                  )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context as BuildContext)
              .showSnackBar(const SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text(
                    "Este e-mail já está cadastrado",
                    style: TextStyle(fontSize: 18.0),
                  )));
        }
      }
    }
  }

}
