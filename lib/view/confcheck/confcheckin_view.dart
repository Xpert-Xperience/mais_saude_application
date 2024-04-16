import 'package:flutter/material.dart';
import 'package:mais_saude/view/checkin/checkin_view.dart';
import 'package:mais_saude/view/common/build_return_button.dart';
import 'package:mais_saude/view/principal/principal_view.dart';

class Confcheck extends StatefulWidget {
  const Confcheck({super.key});

  @override
  State<Confcheck> createState() => _ConfcheckState();
}

class _ConfcheckState extends State<Confcheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 3, 3),
        leading: buildBackButton(context),
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
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'de espera',
                          style: TextStyle(
                              color: Colors.black,
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
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 90),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Checkin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      backgroundColor: Colors.black),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Principal()),
                  );
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 0, 0, 0),
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
