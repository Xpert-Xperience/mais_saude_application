import 'package:flutter/material.dart';
import 'package:mais_saude/controller/checkin_controller.dart';
import 'package:mais_saude/model/fila_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mais_saude/view/pages/checkin/checkin_cancel_view.dart';
import 'package:mais_saude/view/pages/checkin/checkin_confirmation_view.dart';
import 'package:mais_saude/view/pages/others/home_application_view.dart';

class Checkin extends StatefulWidget {
  const Checkin({super.key});

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  final CheckinController _controller = CheckinController();
  late String userId;

  @override
  void initState() {
    super.initState();
    // Assumindo que você recupera o userId do FirebaseAuth
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  @override
  Widget build(BuildContext context) {
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
          'Check-In',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<FilaConsulta>(
        stream: _controller.getFilaConsultaStream(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar dados da fila.'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Nenhum dado disponível.'));
          }

          FilaConsulta fila = snapshot.data!;

          return SingleChildScrollView(
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
                    padding: EdgeInsets.only(left: 10.0),
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
                  _buildCenterNumberWidget(fila.ficha), // Número central
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildNumberWidget(
                          fila.pessoasEsperando.toString(), 'Pessoas Esperando'),
                      const SizedBox(width: 20),
                      _buildNumberWidget(
                          fila.tempoEstimado.toString(), 'Tempo Estimado(MIN)'),
                    ],
                  ),
                  const SizedBox(height: 70),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCenterNumberWidget(String number) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Color(0xff0D4542),
          ),
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
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Color(0xff0D4542),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 18, color: Color(0xff0D4542)),
        ),
      ],
    );
  }
}
