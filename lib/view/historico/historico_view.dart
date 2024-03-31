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
                prefixIcon: Icon(Icons.search),
                hintText: 'Digite o nome',
                labelStyle: TextStyle(
                  color: Color(0xFF0D4542),
                  fontSize: 15,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // Lógica para limpar o campo de pesquisa
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF28928B), // Borda da barra de pesquisa
                  ),
                ),
              ),
              onChanged: (value) {
                // Lógica para filtrar os resultados de acordo com o valor digitado
              },
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  height: 160, // Altura dos cards aumentada
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF28928B)), // Borda vermelha
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: Icon(Icons.person, size: 50),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nome do Profissional',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF0D4542),
                                ),
                              ),
                              SizedBox(height: 2), // Espaçamento para o texto pequeno
                              Text(
                                'Data/Horário',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF0D4542),
                                ),
                              ),
                              SizedBox(height: 18),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navegar para a página de informações
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Cancelamento()),
                                      );
                                    },
                                    child: Container(
                                      child: Row(
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
                                  SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      // Navegar para a página de informações
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Informacoes()),
                                      );
                                    },
                                    child: Row(
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
        backgroundColor: Color(0xFF136A65),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        iconSize: 30,
        currentIndex: 0,
        fixedColor: Color.fromARGB(255, 255, 255, 255),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Historico()),
              );
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
