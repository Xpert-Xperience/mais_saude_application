import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mais_saude/controller/cadastro/cadastro_controller.dart';
import 'package:mais_saude/view/login/login_view.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final CadastroController _controller = CadastroController();

  final _formkey = GlobalKey<FormState>();

  String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 2) {
      return '($phoneNumber'; // Adiciona '(' no início
    } else if (phoneNumber.length <= 6) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2)}'; // Formata até o sexto dígito
    } else if (phoneNumber.length <= 10) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}'; // Formata até o décimo dígito
    } else {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7, 11)}'; // Formata completo
    }
  }

  bool isEmailValid(String email) {
    // Utilizando uma expressão regular para verificar se o e-mail tem um formato válido
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

   String? _emailError;

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false, bool isPhoneNumber = false, bool isEmail = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, preencha todos os dados';
            }
            if (isEmail && !isEmailValid(value)) {
              setState(() {
              _emailError = 'E-mail inválido';
              });
            return 'E-mail inválido';
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            enabledBorder: border,
            focusedBorder: border,
            errorText: isEmail ? _emailError : null, 
          ),
          obscureText: isPassword,
          keyboardType: isPhoneNumber ? TextInputType.phone : (isEmail ? TextInputType.emailAddress : TextInputType.text),
          inputFormatters: isPhoneNumber
              ? [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(11)]
              : null,
          onChanged: (value) {
            if (isPhoneNumber) {
              final formatted = _formatPhoneNumber(value);
              if (formatted != controller.text) {
                controller.value = controller.value.copyWith(
                  text: formatted,
                  selection: TextSelection.collapsed(offset: formatted.length),
                );
              }
            }
            if (isEmail) {
              setState(() {
                _emailError = null; // Limpa o erro ao editar
              });
            }
          },
        ),
        if (isEmail && _emailError != null) // Mostra o texto de erro se houver erro de e-mail
          Text(
            _emailError!,
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 1),
                  const Text(
                    'Cadastro',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0D4542)),
                  ),
                  const SizedBox(height: 15),
                  _inputField("Matricula", _controller.matriculaController),
                  const SizedBox(height: 15),
                  _inputField("Nome", _controller.nomeController),
                  const SizedBox(height: 15),
                  _inputField("E-mail", _controller.emailController, isEmail: true),
                  const SizedBox(height: 15),
                  _inputField("Telefone", _controller.telefoneController, isPhoneNumber: true),
                  const SizedBox(height: 15),
                  _inputField("Senha", _controller.senhaController,
                      isPassword: true),
                  const SizedBox(height: 15),
                  _inputField(
                      "Confirmar Senha", _controller.confirmarSenhaController, isPassword: true),
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
        // _controller.adicionarInfo(
        //     _controller.matriculaController.text.trim(),
        //     _controller.nomeController.text.trim(),
        //     _controller.emailController.text.trim(),
        //     _controller.telefoneController.text.trim());
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
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
