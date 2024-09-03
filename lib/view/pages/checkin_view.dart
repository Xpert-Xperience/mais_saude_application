import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/checkin_cancel_view.dart';
import 'package:mais_saude/view/pages/checkin_confirmation_view.dart';
import 'package:mais_saude/controller/queue_controller.dart';

class Checkin extends StatefulWidget {
  const Checkin({super.key});

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  late QueueController _queueController;

  @override
  void initState() {
    super.initState();
    _queueController = QueueController();
  }

  @override
  Widget build(BuildContext context) {
    // Obtém os dados da fila
    final queueData = _queueController.getQueueData();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF136A65),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Confcheck()),
            );
          },
        ),
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
                  color: Color(0xff0D4542),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Em Serviço',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff014B47),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sua Ficha É:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff0D4542),
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildCenterNumberWidget(queueData.userNumber.toString(), screenWidth), // Número central dinâmico
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberWidget(
                    queueData.waitingPeople.toString(),
                    'Pessoas \nEsperando',
                    screenWidth,
                  ),
                  const SizedBox(width: 20),
                  _buildNumberWidget(
                    queueData.estimatedTime.toString(),
                    'Tempo \nEstimado (MIN)',
                    screenWidth,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cancelcheck()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0A9080),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterNumberWidget(String number, double screenWidth) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: screenWidth * 0.2,
            fontWeight: FontWeight.bold,
            color: const Color(0xff0D4542),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildNumberWidget(String number, String description, double screenWidth) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: screenWidth * 0.1,
            fontWeight: FontWeight.bold,
            color: const Color(0xff0D4542),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            color: const Color(0xff0D4542),
          ),
        ),
      ],
    );
  }
}
