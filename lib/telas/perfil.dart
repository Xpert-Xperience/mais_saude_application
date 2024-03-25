import 'package:flutter/material.dart';
import 'package:mais_saude/telas/login.dart';
import 'package:mais_saude/telas/principal.dart';

class perfil extends StatefulWidget {
  const perfil({super.key});

  @override
  State<perfil> createState() => _perfilState();
}

class _perfilState extends State<perfil> {
 double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: displayHeight() / 4,
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        _buildTextField("Email", "chiquin@gmail.com"),
                        _buildTextField("Matrícula", "123456"),
                        _buildTextField("Celular", "85998876543"),
                        SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 0, 0),
                              minimumSize: Size(150, 40),
                            ),
                            onPressed: () {
                              // Adicione aqui a lógica para a ação do botão "Editar"
                            },
                            child: Text(
                              'Editar',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: displayHeight() / 7 + 167 + 20,
            left: displayWidth() / 1.52 - 167 / 2, 
            child: Center(
              child: Text(
                'Erick',
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,),
              ),
            ),
          ),
          Positioned(
            top: displayHeight() / 6,
            left: displayWidth() / 2 - 167 / 2, 
            child: Container(
              width: 167, 
              height: 156, 
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey, 
                image: DecorationImage(
                  image: AssetImage('assets/erick.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 47, 47),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
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
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const principal()),
              );
              break;
            case 1:
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const principal()),
              );
              break;
            case 2:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const perfil()),
              );
              break;
          }
        }
      ),
    );
  }
  
  Widget _buildTextField(String labelText, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10), 
        Container(
          width: 400, 
          height: 45, 
          margin: EdgeInsets.symmetric(vertical: 5), 
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), 
            borderRadius: BorderRadius.circular(10), 
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              value, 
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}