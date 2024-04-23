import 'package:flutter/material.dart';
import 'package:mais_saude/view/login/login_view.dart';
import 'package:mais_saude/controller/cadastro/cadastro_controller.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final CadastroController _controller = CadastroController();

  final _formkey = GlobalKey<FormState>();

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
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF136863),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0D4542)),
                  ),
                  const SizedBox(height: 15),
                  _inputField("Matrícula", _controller.matriculaController),
                  const SizedBox(height: 15),
                  _inputField("Nome", _controller.nomeController),
                  const SizedBox(height: 15),
                  _inputField("E-mail", _controller.emailController),
                  const SizedBox(height: 15),
                  _inputField("Telefone", _controller.telefoneController),
                  const SizedBox(height: 15),
                  _inputField("Senha", _controller.senhaController, isPassword: true),
                  const SizedBox(height: 15),
                  _inputField("Confirmar Senha", _controller.confirmarSenhaController,
                      isPassword: true),
                  const SizedBox(height: 30),
                  _cadastrarBtn(context),
                  const SizedBox(height: 20),
                  _loginText(),
                  const SizedBox(height: 23),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1.8, color: Color(0xFF0D4542)),
    );

    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha todos os dados';
        }
        return null;
      },
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

  Widget _cadastrarBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          setState(() {
            _controller.email = _controller.emailController.text;
            _controller.nome = _controller.nomeController.text;
            _controller.senha = _controller.senhaController.text;
          });
        }
        _controller.registerUser(context);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Color(0xFF0A9080),
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
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const LoginView(key: ValueKey('login_screen'))));
      },
      child: const Text(
        "Já tem uma conta? Login",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: Color(0xFF005651)),
      ),
    );
  }
}
