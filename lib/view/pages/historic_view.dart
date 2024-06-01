import 'package:flutter/material.dart';
import 'package:mais_saude/view/components/custom_bottom_navigation_bar.dart';
import 'package:mais_saude/view/pages/historic_schedule_information_view.dart';
import 'package:mais_saude/view/pages/schedule_cancel_view.dart';

class Historic extends StatefulWidget {
  const Historic({super.key});

  @override
  State<Historic> createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {
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
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Digite o nome',
                labelStyle: const TextStyle(
                  color: Color(0xFF0D4542),
                  fontSize: 15,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // Lógica para limpar o campo de pesquisa
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
                // Lógica para filtrar os resultados de acordo com o valor digitado
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  height: 160, // Altura dos cards aumentada
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF28928B),
                        width: 2), // Borda vermelha
                    borderRadius:
                        BorderRadius.circular(10), // Borda arredondada
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
                                'Nome do Profissional',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF0D4542),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      2), // Espaçamento para o texto pequeno
                              const Text(
                                'Data/Horário',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF0D4542),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navegar para a página de informações
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
                                            color: Color(
                                                0xFF0D4542)), // Ícone de cancelar
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
                                      // Navegar para a página de informações
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Information()),
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.info,
                                            color: Color(
                                                0xFF0D4542)), // Ícone de informações
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
