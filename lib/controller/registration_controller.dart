// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/model/user_model.dart';
import 'package:mais_saude/view/pages/login/login_view.dart';

class RegistrationController {
  String email = "",
      name = "",
      password = "",
      confirmPassword = "",
      matricula = "",
      telephone = "";

  TextEditingController matriculaController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  // Utiliza as funções existentes em "FirebaseAuth" para criar um usuário usando email e senha como método
  Future<void> registerUser(BuildContext context) async {
    if (nameController.text != "" && emailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        // Use o UID do usuário criado
        String userId = userCredential.user!.uid;

        toAddInfo(
            matriculaController.text,
            nameController.text,
            emailController.text,
            telephoneController.text,
            userId); //Adiciona as informações cadastradas ao usuário criado

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Registrado com sucesso!",
                style: TextStyle(fontSize: 20.0))));

        Navigator.push(
            context, //Direciona para página de login
            MaterialPageRoute(builder: (context) => const LoginView()));
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
  // //Verifica se a matricula adiciona é única no banco de dados
  // Future<bool> isMatriculaUnique(String matricula) async {
  //   final docRef = db.collection("usuarios").doc(matricula);
  //   final docSnap = await docRef.get();
  //   return !docSnap.exists;
  // }

  //Método que permite que as informações sejam adicionadas
  toAddInfo(matricula, name, email, telephone, String userId) async {
    UserModel user = UserModel(
        matricula: matricula, name: name, email: email, telephone: telephone);
    db.collection("users").doc(userId).set(user.toFirestore());
  }
}
