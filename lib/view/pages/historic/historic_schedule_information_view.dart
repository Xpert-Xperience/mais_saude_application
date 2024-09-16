import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mais_saude/view/pages/schedule/schedule_cancel_view.dart'; // Importando o pacote intl para formatação de datas

class Information extends StatefulWidget {
  final String profissionalNome;
  final String data;
  final String? hora;

  const Information({
    super.key,
    required this.profissionalNome,
    required this.data,
    this.hora,
  });

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Detalhes',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          const SizedBox(height: 60), // Espaço entre a AppBar e o Body
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centraliza os elementos horizontalmente
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.person, size: 70),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.profissionalNome,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0D4542),
                          ),
                        ),
                        const SizedBox(
                            height: 2), // Espaçamento para o texto pequeno
                        const Text(
                          'Clínico Geral', // Ajuste conforme necessário
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF0D4542),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.all(16),
            height: 140, // Altura dos cards aumentada
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF28928B), width: 2),
              borderRadius: BorderRadius.circular(10), // Borda arredondada
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Data e hora: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF0D4542),
                        ),
                      ),
                      Text(
                        '${widget.data}${widget.hora != null ? ' às ${widget.hora}' : ''}',
                        style: const TextStyle(
                          fontSize: 11.3,
                          color: Color(0xFF0D4542),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Row(
                    children: [
                      Text(
                        'Local: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF0D4542),
                        ),
                      ),
                      Text(
                        'IFCE - Campus Fortaleza.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF0D4542),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScheduleCancellation()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(displayWidth(context) * 0.8, 55),
                backgroundColor: const Color(0xFF0A9080),
              ),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
