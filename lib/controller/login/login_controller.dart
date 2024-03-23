import 'package:flutter/material.dart';
import 'package:mais_saude/view/principal/principal_view.dart';
import 'package:path/path.dart';
import 'package:mais_saude/services/auth_service.dart';


class LoginController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final DatabaseHelper _databaseService = DatabaseHelper();

  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    bool success = await _databaseService.login(username, password);
    if (success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => Principal()),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
        content: Text('Credenciais inválidas'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
