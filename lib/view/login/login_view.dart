import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mais_saude/controller/login/login_controller.dart';
import 'package:mais_saude/view/cadastro/cadastro_view.dart';
import 'package:mais_saude/view/common/build_return_button.dart';
import 'package:mais_saude/view/esqueceu_senha/confirmar_esqueceu_senha_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _controller = LoginController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _controller.user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: _page(context),
      ),
    );
  }

  Widget _page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBackButton(context),
              const SizedBox(height: 60),
              const Text(
                'Seja Bem-Vindo!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 130),
              _inputField("Email", _controller.emailController),
              const SizedBox(height: 70),
              _inputField("Senha", _controller.passwordController,
                  isPassword: true),
              const SizedBox(height: 50),
              _loginBtn(context),
              const SizedBox(
                height: 10,
              ),
              _loginGoogleBtn(context),
              const SizedBox(height: 20),
              _extraText(),
            ],
          ),
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

    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor preencha todos os campos';
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

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          setState(() {
            _controller.email = _controller.emailController.text;
            _controller.password = _controller.passwordController.text;
          });
        }
        _controller.userLogin(context);
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

  Widget _loginGoogleBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _controller.userGoogleLogin(context);
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Sign in with Google",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
              MaterialPageRoute(
                  builder: (context) => const ConfirmarEsqueceuSenha()),
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
              MaterialPageRoute(builder: (context) => const CadastroView()),
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
