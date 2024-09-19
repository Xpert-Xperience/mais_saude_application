import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/view/components/custom_bottom_navigation_bar.dart';
import 'package:mais_saude/view/pages/checkin/checkin_confirmation_view.dart';
import 'package:mais_saude/view/pages/checkin/checkin_view.dart';
import 'package:mais_saude/view/pages/schedule/schedule_appoitment_select_date_view.dart';

class HomeApplication extends StatefulWidget {
  const HomeApplication({super.key});

  @override
  State<HomeApplication> createState() => _HomeApplicationState();
}

class _HomeApplicationState extends State<HomeApplication> {
    String? userName = ''; // Variável para armazenar o nome do usuário

    @override
    void initState() {
      super.initState();
      fetchUserName(); // Chama a função para buscar o usuário ao inicializar
    }

    Future<void> fetchUserName() async {
    try {
     
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
 
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance.collection('users').doc(userId).get();

        if (userDoc.exists) {
      
          setState(() {
            userName = userDoc.get('name');
          });
        }
      }
    } catch (e) {
      print('Erro ao buscar o nome do usuário: $e');
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF0D4542), fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Bem vindo, $userName",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Próxima Consulta',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 350,
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: const Color(0xFF28928B)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dr. Matheus\nClínico Geral'),
                    const SizedBox(width: 60),
                    Container(
                      width: 1.5,
                      height: 40,
                      color: Color(0xFF28928B),
                    ),
                    const SizedBox(width: 40),
                    const Text('33/33/3333'),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            const ScheduleAppitmentSelectDate(especialidade: 'Fisioterapia')),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF28928B)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/icons8-quiropraxia-fisioterapia-externa-inipagistudio-lineal-color-inipagistudio-64.png",
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
                    MaterialPageRoute(
                        builder: (context) =>
                            const ScheduleAppitmentSelectDate(especialidade: 'Odontologia')),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF28928B)),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            const ScheduleAppitmentSelectDate(especialidade: 'Clinico Geral')),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: const Color(0xFF28928B)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/icons8-mais-96.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Clínico Geral',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
  onTap: () async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final filaRef = FirebaseFirestore.instance.collection('filas').doc(user.uid);
      final snapshot = await filaRef.get();

      if (snapshot.exists) {
        // Se já existe, vai diretamente para a fila
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Checkin()),
        );
      } else {
        // Caso contrário, vai para a confirmação de check-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Confcheck()),
        );
      }
    }
  },
  child: Column(
    children: [
      Container(
        width: 125,
        height: 115,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: const Color(0xFF28928B)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          "assets/icons8-cérebro-96.png",
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
