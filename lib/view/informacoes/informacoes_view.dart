import 'package:flutter/material.dart';
import 'package:mais_saude/view/principal/principal_view.dart';
import 'package:mais_saude/view/perfil/perfil.dart';
import 'package:mais_saude/view/historico/historico_view.dart';
import 'package:mais_saude/view/cancelamento/cancelamento_view.dart';

class Informacoes extends StatefulWidget {
  const Informacoes({super.key});

  @override
  State<Informacoes> createState() => _InformacoesState();
}

class _InformacoesState extends State<Informacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 3, 3),
        leading: Container(
          decoration: BoxDecoration(),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Detalhes',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          SizedBox(height: 60), // Espaço entre a AppBar e o Body
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centraliza os elementos horizontalmente
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(Icons.person, size: 70),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0D4542),
                          ),
                        ),
                        SizedBox(height: 2), // Espaçamento para o texto pequeno
                        Text(
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
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(16),
            height: 140, // Altura dos cards aumentada
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF28928B), width: 2),
              borderRadius: BorderRadius.circular(10), // Borda arredondada
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Data e hora: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF0D4542),
                        ),
                      ),
                      Text(
                        'Quinta, 17 de março às 13:00h',
                        style: TextStyle(
                          fontSize: 11.3,
                          color: Color(0xFF0D4542),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
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
          SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cancelamento()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(displayWidth(context) * 0.8, 55),
                backgroundColor: Color(0xFF0A9080),
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
