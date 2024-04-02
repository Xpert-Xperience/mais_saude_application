import 'package:flutter/material.dart';
import 'package:mais_saude/model/usuario.dart';
import 'package:mais_saude/services/database_service.dart';
import 'package:mais_saude/view/login/login_view.dart';

class CadastroController {
  TextEditingController matriculaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  void cadastrarUsuario(context) async {
    String matricula = matriculaController.text;
    String nome = nomeController.text;
    String email = emailController.text;
    String telefone = telefoneController.text;
    String senha = senhaController.text;
    String confirmarSenha = confirmarSenhaController.text;

    if (senha != confirmarSenha) {
      // Handle password mismatch
      return;
    }

    Usuario user = Usuario(
      matricula: matricula,
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
    );

    DatabaseService dbHelper = DatabaseService();
    int userId = await dbHelper.insertUser(user.toMap());

    if (userId != 0) {

      // Print all users in the database
      await dbHelper.printUsers();

      // User inserted successfully, navigate to login screen
      Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context) => const LoginView(key: ValueKey('login_screen'))));
    } else {
      // Handle failure to insert user
    }
  }
}
