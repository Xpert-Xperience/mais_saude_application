import 'package:flutter/material.dart';
import 'package:mais_saude/view/components/custom_bottom_navigation_bar.dart';
import 'package:mais_saude/view/pages/historic/historic_schedule_information_view.dart';
import 'package:mais_saude/view/pages/schedule/schedule_cancel_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importar o Firebase Auth
import 'package:intl/intl.dart'; // Importando o pacote intl para formatação de datas

class Historic extends StatefulWidget {
  const Historic({super.key});

  @override
  State<Historic> createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {
  String? _getCurrentUserId() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF0D4542), fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('consultas')
                  .where('userId',
                      isEqualTo:
                          _getCurrentUserId()) // Filtra pelo usuário logado
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text('Nenhuma consulta encontrada.'));
                }

                final consultas = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: consultas.length,
                  itemBuilder: (context, index) {
                    final consulta = consultas[index];

                    // Extrai o ID da consulta
                    final consultaId = consulta.id;

                    return Container(
                      margin: const EdgeInsets.all(16),
                      height: 160, // Altura dos cards
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF28928B), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(Icons.person, size: 50),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    consulta['especialidade'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color(0xFF0D4542),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Data: ${DateFormat('dd/MM/yyyy').format(consulta['data'].toDate())}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0D4542),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Passando o ID da consulta para a tela de cancelamento
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScheduleCancellation(
                                                consultaId:
                                                    consultaId, // Aqui está a correção
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(Icons.cancel,
                                                color: Color(0xFF0D4542)),
                                            SizedBox(width: 4),
                                            Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF0D4542),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Information(
                                                profissionalNome:
                                                    consulta['especialidade'],
                                                data: DateFormat('dd/MM/yyyy')
                                                    .format(consulta['data']
                                                        .toDate()),
                                                hora: consulta['hora'],
                                                consultaId: consultaId,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(Icons.info,
                                                color: Color(0xFF0D4542)),
                                            SizedBox(width: 4),
                                            Text(
                                              'Informações',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF0D4542),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
