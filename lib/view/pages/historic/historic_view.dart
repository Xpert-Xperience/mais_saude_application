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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Função para obter o ID do usuário logado
  String? _getCurrentUserId() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.uid; // Retorna o ID do usuário logado
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Digite o nome do Doutor(a)',
                labelStyle: const TextStyle(
                  color: Color(0xFF0D4542),
                  fontSize: 15,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1.8,
                      color: Color(
                          0xFF28928B)), // Definindo a cor da borda quando não está em foco
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1.8,
                      color: Color(
                          0xFF28928B)), // Definindo a cor da borda quando está em foco
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('consultas')
                  .where('userId',
                      isEqualTo: _getCurrentUserId()) // Filtra por userId
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text('Nenhuma consulta encontrada.'));
                }

                final consultas = snapshot.data!.docs.where((doc) {
                  const profissionalNome = "lucas";
                  return profissionalNome
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase());
                }).toList();

                if (consultas.isEmpty) {
                  return const Center(
                      child: Text('Nenhuma consulta encontrada.'));
                }

                return ListView.builder(
                  itemCount: consultas.length,
                  itemBuilder: (context, index) {
                    final consulta = consultas[index];
                    const profissionalNome = "Lucas";
                    final data = consulta['data'] as Timestamp?;
                    final hora = consulta['hora'] as String?;

                    // Verificando se o Timestamp está presente e formatando-o
                    final formattedDate = data != null
                        ? DateFormat('dd/MM/yyyy').format(data.toDate())
                        : 'Data não disponível';
                    final dataHorario =
                        '$formattedDate às $hora'; // Combina data e hora

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
                                  const Text(
                                    profissionalNome,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color(0xFF0D4542),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    dataHorario,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF0D4542),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ScheduleCancellation()),
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
                                                fontSize: 14,
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
                                                    profissionalNome,
                                                data: formattedDate,
                                                hora: hora,
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
                                                fontSize: 14,
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
