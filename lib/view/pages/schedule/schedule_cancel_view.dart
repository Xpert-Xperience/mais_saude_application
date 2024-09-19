import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mais_saude/view/pages/historic/historic_view.dart';

class ScheduleCancellation extends StatefulWidget {
  final String consultaId; // Recebe o ID da consulta a ser cancelada

  const ScheduleCancellation({super.key, required this.consultaId});

  @override
  State<ScheduleCancellation> createState() => _ScheduleCancellationState();
}

class _ScheduleCancellationState extends State<ScheduleCancellation> {
  // Função para cancelar a consulta
  Future<void> _cancelarConsulta() async {
    try {
      // Deleta o documento da consulta pelo ID
      await FirebaseFirestore.instance
          .collection('consultas')
          .doc(widget.consultaId)
          .delete();

      // Exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consulta cancelada com sucesso!')),
      );

      // Redireciona para a tela de histórico
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Historic()),
        (route) => false,
      );
    } catch (e) {
      // Exibe uma mensagem de erro caso algo dê errado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao cancelar consulta.')),
      );
    }
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
        title: const Text(
          'Cancelamento',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Cancelar Agendamento',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D4542),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Tem certeza que deseja CANCELAR esse agendamento? Essa ação não poderá ser desfeita.',
              style: TextStyle(fontSize: 14, color: Color(0xFF014B47)),
            ),
            const SizedBox(height: 110),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Exibe um diálogo de confirmação antes de cancelar
                  final bool confirm = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirmar Cancelamento'),
                        content: const Text(
                            'Você tem certeza que deseja cancelar esta consulta?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false); // Não cancelar
                            },
                            child: const Text('Não'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(true); // Confirmar cancelamento
                            },
                            child: const Text('Sim'),
                          ),
                        ],
                      );
                    },
                  );

                  // Se o usuário confirmar, cancelar a consulta
                  if (confirm == true) {
                    await _cancelarConsulta();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.8, 55),
                  backgroundColor: const Color(0xFF0A9080),
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
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Manter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF014B47),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
