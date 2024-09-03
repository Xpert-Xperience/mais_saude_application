import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/checkin_view.dart';
import 'package:mais_saude/view/pages/home_application_view.dart';

class Confcheck extends StatefulWidget {
  const Confcheck({super.key});

  @override
  State<Confcheck> createState() => _ConfcheckState();
}

class _ConfcheckState extends State<Confcheck> {
  @override
  Widget build(BuildContext context) {
    // Dimensões da tela
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF136A65),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeApplication()),
            );
          },
        ),
        title: const Text(
          'Confirmação',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              const Text(
                'Entrar na fila\nde espera',
                style: TextStyle(
                  color: Color(0xff0D4542),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                'Tem certeza que deseja entrar na fila\nde espera para a consulta?',
                style: TextStyle(
                  color: Color(0xff014B47),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Checkin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.7, 50),
                    backgroundColor: const Color(0xff0A9080),
                  ),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeApplication()),
                    );
                  },
                  child: const Text(
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
