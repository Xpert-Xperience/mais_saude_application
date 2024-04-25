import 'package:flutter/material.dart';
import 'package:mais_saude/view/confcheck/confcheckin_view.dart';
import 'package:mais_saude/view/marcar_consulta/marcacao1_view.dart';
import 'package:mais_saude/view/perfil/perfil.dart';
import 'package:mais_saude/view/historico/historico_view.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF0D4542), fontWeight: FontWeight.bold)
          ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Olá, Lucas', style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Próxima Consulta',style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 310,
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.8, color: Color(0xFF28928B)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nome do Doutor\nEspecialidade'),
                    const SizedBox(width: 40),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 40),
                    const Text('Data'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const marcacao1()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.8, color: Color(0xFF28928B)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/icons8-physical-therapy-96.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text('Fisioterapia',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const marcacao1()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.8, color: Color(0xFF28928B)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/icons8-hora-do-dentista-96.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Odontologia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const marcacao1()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.8, color: Color(0xFF28928B)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/icons8-plus-96.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Clínico Geral',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight:
                              FontWeight.w500, 
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Confcheck()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.8, color: Color(0xFF28928B)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/icons8-head-with-brain-96.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Psicologia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff136A65),
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
