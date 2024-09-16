import 'package:flutter/material.dart';
import 'package:mais_saude/controller/login_controller.dart';
import 'package:mais_saude/view/components/custom_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  final LoginController _controller = LoginController();
  String? userName = "";
  String? userEmail = "";
  String? userMatricula = "";
  String? userPhone = "";

  @override
  void initState() {
    super.initState();
    fetchUserProfile(); // Busca as informações do usuário ao carregar a página
  }

  Future<void> fetchUserProfile() async {
    try {
      // Obtém o UID do usuário autenticado
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        // Busca o documento do Firestore com base no UID
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance.collection('users').doc(userId).get();

        if (userDoc.exists) {
          // Extrai o nome, email, matrícula e telefone do usuário
          setState(() {
            userName = userDoc.get('name');
            userEmail = userDoc.get('email');
            userMatricula = userDoc.get('matricula');
            userPhone = userDoc.get('telephone');
          });
        }
      }
    } catch (e) {
      print('Erro ao buscar os dados do usuário: $e');
    }
  }

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
                        _buildTextField("Email", "$userEmail"),
                        _buildTextField("Matrícula", "$userMatricula"),
                        _buildTextField("Celular", "$userPhone"),
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
  top: MediaQuery.of(context).size.height / 6, // Ajuste conforme necessário
  left: MediaQuery.of(context).size.width / 2 - 167 / 2,
  child: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min, // Use o tamanho mínimo necessário
      children: [
        Container(
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
        const SizedBox(height: 20), 
        Text(
          userName ?? 'Nome não disponível',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),

        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
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
            border: Border.all(color: const Color(0xff28928B), width: 1.8),
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
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}