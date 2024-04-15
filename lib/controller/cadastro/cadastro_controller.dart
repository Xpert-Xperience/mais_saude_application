// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/model/usuario_model.dart';
import 'package:mais_saude/view/login/login_view.dart';

class CadastroController {
  String email = "",
      nome = "",
      senha = "",
      confirmarSenha = "",
      matricula = "",
      telefone = "";

  TextEditingController matriculaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  registerUser(BuildContext context) async {
    if (nomeController.text != "" && emailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: emailController.text, password: senhaController.text);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Registrado com sucesso!",
                style: TextStyle(fontSize: 20.0))));

        adicionarInfo(matriculaController.text, nomeController.text, emailController.text, telefoneController.text);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Senha fraca, tente outra combinação",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Este e-mail já está cadastrado",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  adicionarInfo(matricula, nome, email, telefone) async {
    Usuario usuario = Usuario(
        matricula: matricula, nome: nome, email: email, telefone: telefone);

    db.collection("usuarios").add(usuario.toFirestore());
  }
}
