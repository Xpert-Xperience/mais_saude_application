import 'package:flutter/material.dart';
import 'package:mais_saude/view/marcar_consulta/marcacao_view.dart';
import 'package:mais_saude/view/perfil/perfil.dart';
import 'package:mais_saude/view/principal/principal_view.dart';
import 'package:mais_saude/view/historico/historico_view.dart';
import 'calendario/calendario.dart';

class marcacao1 extends StatefulWidget {
  const marcacao1({super.key});

  @override
  State<marcacao1> createState() => _marcacao1State();
}

class _marcacao1State extends State<marcacao1> {
  @override
  Widget build(BuildContext context) {
    double displayHeight() => MediaQuery.of(context).size.height;
    double displayWidth() => MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30, 
              color: Color.fromARGB(255, 7, 7, 7), 
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Principal()),
            );
            },
          ),
        ),
        //alinhar titulo no centro
        title: const Text('Marcação',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Center(
                child: Container(
                  width: 300,
                  height: 250,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Dr.Lucas Davi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Fisioterapia', //Aqui o valor do text precisa ser alterado de acordo com a escolha da tela inicial
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            '7:00 -- 12H30', //Aqui o valor do text precisa ser alterado de acordo com a escolha da tela inicial
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Data da marcação',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
        Container(
          width: displayWidth() / 0.5,
          height: 360,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Calendario(),
          ),
        ), 
         ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 3, 3, 3),
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        iconSize: 30,
        currentIndex: 0,
        fixedColor: const Color.fromARGB(255, 6, 7, 7),
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
