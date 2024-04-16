import 'package:flutter/material.dart';
import 'package:mais_saude/view/cancelamentocheck/cancelamentocheck_view.dart';
import 'package:mais_saude/view/common/build_return_button.dart';

class Checkin extends StatefulWidget {
  const Checkin({super.key});

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 3, 3),
        leading: buildBackButton(context),
        title: const Text(
          'Check-In',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Fila Para Consulta',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Em Serviço',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sua Ficha É:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildCenterNumberWidget('123'), // Número central
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberWidget('03', 'Pessoas Esperando'),
                  const SizedBox(width: 20),
                  _buildNumberWidget('60', 'Tempo Estimado(MIN)'),
                ],
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Cancelcheck()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterNumberWidget(String number) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
              fontSize: 100, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildNumberWidget(String number, String description) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}
