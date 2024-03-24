import 'package:flutter/material.dart';
import 'package:mais_saude/view/principal/principal_view.dart';
import 'package:mais_saude/services/auth_service.dart';


class LoginController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final DatabaseHelper _databaseService = DatabaseHelper();


  LoginController({
      required this.usernameController,
      required this.passwordController,
    });

  void login(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Por favor, preencha todos os campos.'),
        duration: Duration(seconds: 2),
      ));
      return; // Não faz a verificação se username ou password estiverem vazios
    }
    bool success = await _databaseService.login(username, password);

    if (success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Principal()),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Credenciais inválidas'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
