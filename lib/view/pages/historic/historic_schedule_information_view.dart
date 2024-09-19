import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/schedule/schedule_cancel_view.dart';

class Information extends StatefulWidget {
  final String profissionalNome;
  final String data;
  final String? hora;
  final String consultaId; // Adicionando o parâmetro consultaId

  const Information({
    super.key,
    required this.profissionalNome,
    required this.data,
    this.hora,
    required this.consultaId, // Tornando o parâmetro obrigatório
  });

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF136A65),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Detalhes', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
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
                            fontSize: 18,
                            color: Color(0xFF0D4542),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Clínico Geral',
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
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF28928B), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                // Passando o ID da consulta ao navegar para a tela de cancelamento
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleCancellation(
                      consultaId:
                          widget.consultaId, // Agora passando o ID correto
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(displayWidth(context) * 0.8, 55),
                backgroundColor: const Color(0xFF0A9080),
              ),
              child: const Text(
                'Cancelar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
