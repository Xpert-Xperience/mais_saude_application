import 'package:flutter/material.dart';
import 'package:mais_saude/view/principal/principal_view.dart';
import 'package:mais_saude/view/perfil/perfil.dart';
import 'package:mais_saude/view/informacoes/informacoes_view.dart';
import 'package:mais_saude/view/cancelamento/cancelamento_view.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
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
        borderSide: BorderSide(width: 1.8 ,color: Color(0xFF28928B)), // Definindo a cor da borda quando não está em foco
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.8, color: Color(0xFF28928B)), // Definindo a cor da borda quando está em foco
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
                    border: Border.all(color: const Color(0xFF28928B), width: 2), // Borda vermelha
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
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
                              const SizedBox(height: 2), // Espaçamento para o texto pequeno
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
                                        MaterialPageRoute(builder: (context) => const Cancelamento()),
                                      );
                                    },
                                    child: Container(
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
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      // Navegar para a página de informações
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Informacoes()),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff136A65),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        iconSize: 30,
        currentIndex: 0,
        fixedColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Principal()),
              );
              break;
            case 1:
              break;
              
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Perfil()),
              );
              break;
          }
        },
      ),
    );
  }
}
