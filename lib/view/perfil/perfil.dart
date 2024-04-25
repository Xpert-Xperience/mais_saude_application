import 'package:flutter/material.dart';
import 'package:mais_saude/controller/login/login_controller.dart';
import 'package:mais_saude/view/principal/principal_view.dart';
import 'package:mais_saude/view/historico/historico_view.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                color: const Color(0xFF0D4542),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        _buildTextField("Email", "chiquin@gmail.com"),
                        _buildTextField("Matrícula", "123456"),
                        _buildTextField("Celular", "85998876543"),
                        const SizedBox(
                          height: 30,
                        ),
                        // _editBtn(context),
                        _logoutBtn(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7 + 167 + 20,
            left: MediaQuery.of(context).size.width / 1.52 - 167 / 2,
            child: const Center(
              child: Text(
                'Erick',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            left: MediaQuery.of(context).size.width / 2 - 167 / 2,
            child: Container(
              width: 167,
              height: 156,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('assets/erick.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
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
              break;
          }
        },
      ),
    );
  }

  Widget _buildTextField(String labelText, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          width: 400,
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xff28928B), width: 1.8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _editBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A9080),
          minimumSize: const Size(150, 20),
        ),
        onPressed: () {},
        child: const Text(
          'Editar',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _logoutBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A9080),
          minimumSize: const Size(150, 20),
        ),
        onPressed: () {
          _controller.userLogout(context);
        },
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}