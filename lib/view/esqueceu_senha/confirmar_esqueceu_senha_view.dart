// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConfirmarEsqueceuSenha extends StatefulWidget {
  const ConfirmarEsqueceuSenha({super.key});

  @override
  State<ConfirmarEsqueceuSenha> createState() => _ConfirmarEsqueceuSenhaState();
}

class _ConfirmarEsqueceuSenhaState extends State<ConfirmarEsqueceuSenha> {
  String email = "";
  TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Password Reset Email has been sent !",
        style: TextStyle(fontSize: 20.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "No user found for that email.",
          style: TextStyle(fontSize: 20.0),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Container(
          decoration: const BoxDecoration(),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Esqueceu a',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600, color: Color(0xff0D4542)),
              ),
              const Text(
                'Senha?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600, color: Color(0xff0D4542)),
              ),
              const Text(
                'Digite seu email utilizado no cadastro para receber um \nlink de recuperação',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff005651)),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Color(0xFF28928B)), 
                           borderRadius: BorderRadius.circular(10),
                         ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF28928B)), 
                           borderRadius: BorderRadius.circular(10),
                        ), 
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = emailController.text;
                      });
                      resetPassword();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      backgroundColor: Color(0xff0A9080)),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                  child: Text(
                'Cancelar',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff005651)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
