import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mais_saude/controller/checkin_controller.dart';
import 'package:mais_saude/view/pages/checkin/checkin_view.dart';
import 'package:mais_saude/view/pages/others/home_application_view.dart';

class Confcheck extends StatefulWidget {
  const Confcheck({super.key});

  @override
  State<Confcheck> createState() => _ConfcheckState();
}

class _ConfcheckState extends State<Confcheck> {
  final CheckinController _controller = CheckinController();
  late String userId;

  @override
  void initState() {
    super.initState();
    // Recuperando o userId do FirebaseAuth
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF136A65),
        leading: Container(
          decoration: const BoxDecoration(),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeApplication()),
              );
            },
          ),
        ),
        title: const Text(
          'Confirmação',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(left: 20.0), // Margem à esquerda
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Entrar na fila',
                          style: TextStyle(
                              color: Color(0xff0D4542),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'de espera',
                          style: TextStyle(
                              color: Color(0xff0D4542),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 20.0), // Margem à esquerda
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tem certeza que deseja entrar na fila \nde espera para a consulta?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff014B47),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 90),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _controller.fazerCheckin(userId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Checkin()),
                      );
                    } catch (e) {
                      // Exibir uma mensagem de erro se necessário
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro ao fazer check-in: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: const Color(0xff0A9080),
                  ),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeApplication()),
                  );
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff014B47),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
