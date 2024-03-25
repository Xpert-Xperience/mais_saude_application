import 'package:flutter/material.dart';
import 'package:mais_saude/view/cadastro/cadastro_view.dart';
import 'package:mais_saude/view/login/login_view.dart';

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
        title: const Text('Home', textAlign: TextAlign.center),
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
              child: Text('Olá, Lucas'),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Próxima Consulta'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
  child: Container(
    width: 308,
    height: 75,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Nome do Doutor'),
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

            const SizedBox(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                         "assets/fisioterapia.png", 
                         fit: BoxFit.contain, 
                       ),
                      ),
                      const Text('Fisioterapia',
                       style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                       )
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const CadastroView()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                         "assets/dentista.png", 
                         fit: BoxFit.contain, 
                       ),
                      ),
                        const Text('Odontologia',
                       style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
      ),),

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
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                         "assets/plus.png", 
                         fit: BoxFit.contain, 
                       ),
                      ),
                        const Text('Clínico Geral',
                       style: TextStyle(
                      fontSize: 20, // Tamanho da fonte
                      fontWeight: FontWeight.bold, // Peso da fonte (negrito)
      ),),             
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                         "assets/psico.png", 
                         fit: BoxFit.contain, 
                        ),
                      ),
                       const Text('Psicologia',
                       style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
      ),), 
                      
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Principal()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CadastroView()),
              );
              break;
          }
        },
      ),
    );
  }
}