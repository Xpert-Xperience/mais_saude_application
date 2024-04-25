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

  Future<void> registerUser(BuildContext context) async {
    if (nomeController.text != "" && emailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: senhaController.text);

        // Use the UID from the created user
        String userId = userCredential.user!.uid;

        adicionarInfo(matriculaController.text, nomeController.text,
            emailController.text, telefoneController.text, userId);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Registrado com sucesso!",
                style: TextStyle(fontSize: 20.0))));

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }

  Future<bool> isMatriculaUnique(String matricula) async {
    final docRef = db.collection("usuarios").doc(matricula);
    final docSnap = await docRef.get();
    return !docSnap.exists;
  }

  adicionarInfo( matricula, nome, email, telefone,
      String userId) async {
    Usuario usuario = Usuario(
        matricula: matricula, nome: nome, email: email, telefone: telefone);
    db.collection("usuarios").doc(userId).set(usuario.toFirestore());
  }
}
