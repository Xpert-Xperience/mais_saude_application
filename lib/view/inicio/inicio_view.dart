import 'package:flutter/material.dart';
import 'package:mais_saude/view/cadastro/cadastro_view.dart';
import 'package:mais_saude/view/login/login_view.dart';

// ignore: camel_case_types
class inicial extends StatefulWidget {
  final PageController controller;

  const inicial(this.controller, {super.key});

  @override
  State<inicial> createState() => _inicialState(controller);
}

class _inicialState extends State<inicial> {
  final PageController pageController;

  _inicialState(this.pageController);

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 550,
      child: Column(
  
        children: <Widget>[
          const SizedBox(height: 100), 
          SizedBox(
            height: displayHeight() / 4,
            child: Image.asset(
              "assets/mais.png", 
             width: 420, 
             height: 420, 
             fit: BoxFit.contain, 
  ),
          ),
          const SizedBox(height: 100), 
          const Text(
            'Seja Bem-Vindo!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5), 
          const Text(
            'Marque suas consultas com facilidade \ne praticidade, sem precisar ir ao IF. ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 100), 
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView(key: null,)),
              );
            },
        style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(displayWidth() * 0.8, 55),
              ),
            ),
             child: const Text(
              'Login',
              style: TextStyle(fontSize: 18, color: Colors.white), 
            ),
          ),
          const SizedBox(height: 20), 
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CadastroView()),
              );
            },
        style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(displayWidth() * 0.8, 55),
              ),
            ),
          child: const Text(
              'Cadastro',
              style: TextStyle(fontSize: 18, color: Colors.white), 
            ),
          ),
        ],
      ),
    );
  }
}
