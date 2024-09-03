import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/home_application_view.dart';

class ScheduleConfirmation extends StatefulWidget {
  const ScheduleConfirmation({super.key});

  @override
  State<ScheduleConfirmation> createState() => _ScheduleConfirmationState();
}

class _ScheduleConfirmationState extends State<ScheduleConfirmation> {
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
        centerTitle: true,
        title: const Text('Confirmação', style: TextStyle(fontSize: 25)),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Sua consulta',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff0D4542),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'foi confirmada!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff0D4542),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Foi enviado para o seu email',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff005651),
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 320,
                    height: 320,
                    child: Image.asset(
                      "assets/Sent Message-bro.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
                      minimumSize: const Size(300, 50),
                      backgroundColor: const Color(0xff0A9080)),
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
