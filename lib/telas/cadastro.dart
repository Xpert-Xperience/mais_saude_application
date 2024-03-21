import 'package:flutter/material.dart';
import 'package:mais_saude/telas/login.dart';
import 'package:mais_saude/databaseHelper.dart';

class cadastro extends StatefulWidget {
  const cadastro({Key? key}) : super(key: key);

  @override
  State<cadastro> createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {
  TextEditingController matriculaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Cadastro',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                _inputField("Matrícula", matriculaController),
                const SizedBox(height: 15),
                _inputField("Nome", nomeController),
                const SizedBox(height: 15),
                _inputField("E-mail", emailController),
                const SizedBox(height: 15),
                _inputField("Telefone", telefoneController),
                const SizedBox(height: 15),
                _inputField("Senha", senhaController, isPassword: true),
                const SizedBox(height: 15),
                _inputField("Confirmar Senha", confirmarSenhaController, isPassword: true),
                const SizedBox(height: 30),
                _cadastrarBtn(),
                const SizedBox(height: 20),
                _loginText(),
                const SizedBox(height: 23),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
    );

    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  void _cadastrarUsuario() async {
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

    Map<String, dynamic> user = {
      'matricula': matricula,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };

    DatabaseHelper dbHelper = DatabaseHelper();
    int userId = await dbHelper.insertUser(user);

    if (userId != 0) {
      print('User inserted with ID: $userId');

      // Print all users in the database
      await dbHelper.printUsers();

      // User inserted successfully, navigate to login screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const login(key: ValueKey('login_screen'))));
    } else {
      print('Failed to insert user');
      // Handle failure to insert user
    }
  }

  Widget _cadastrarBtn() {
    return ElevatedButton(
      onPressed: _cadastrarUsuario,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Cadastrar",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginText() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const login(key: ValueKey('login_screen'))));
      },
      child: const Text(
        "Já tem uma conta? Login",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
