import 'package:flutter/material.dart';
import 'package:mais_saude/telas/cadastro.dart';
import 'package:mais_saude/telas/confesq.dart';
import 'package:mais_saude/telas/principal.dart';
import 'package:mais_saude/databaseService.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService(); // Instância da classe fictícia do banco de dados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Container(
                      padding: EdgeInsets.only(left: 0), 
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0), 
                        shape: BoxShape.rectangle, 
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
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
            const SizedBox(height: 60), 
            const Text(
              'Seja Bem-Vindo!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 130), 
            _inputField("Matrícula", usernameController),
            const SizedBox(height: 70),
            _inputField("Senha", passwordController, isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 20),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
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

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () async {
        String username = usernameController.text;
        String password = passwordController.text;
        bool success = await _databaseService.login(username, password);
        if (success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const principal()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Credenciais inválidas'),
            duration: const Duration(seconds: 2),
          ));
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _extraText() {
    return Column(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => confesq()),
            );
          },
          child: const Text(
            "Esqueceu a senha?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cadastro()),
            );
          },
          child: const Text(
            "Não tem uma conta? Cadastre-se",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
    );
  }
}