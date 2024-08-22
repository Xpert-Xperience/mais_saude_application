import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/checkin_view.dart';
import 'package:mais_saude/view/pages/home_application_view.dart';

class Cancelcheck extends StatefulWidget {
  const Cancelcheck({super.key});

  @override
  State<Cancelcheck> createState() => _CancelcheckState();
}

class _CancelcheckState extends State<Cancelcheck> {
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
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          'Cancelamento',
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
                          'Sair da fila',
                          style: TextStyle(
                              color: Color(0xff0D4542),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
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
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20.0), // Margem à esquerda
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tem certeza que deseja sair da fila \nde espera? Essa ação não poderá \nser desfeita.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff014B47),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 110),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeApplication()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 55),
                      backgroundColor: const Color(0xff0A9080)),
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
                    MaterialPageRoute(builder: (context) => const Checkin()),
                  );
                },
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Manter',
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