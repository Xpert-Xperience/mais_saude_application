import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/view/components/custom_bottom_navigation_bar.dart';
import 'package:mais_saude/view/pages/checkin_confirmation_view.dart';
import 'package:mais_saude/view/pages/schedule_appoitment_select_date_view.dart';

class HomeApplication extends StatefulWidget {
  const HomeApplication({super.key});

  @override
  State<HomeApplication> createState() => _HomeApplicationState();
}

class _HomeApplicationState extends State<HomeApplication> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Aqui você precisa buscar o nome do usuário no Firestore usando o userId
      final docSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .get();
      if (docSnapshot.exists) {
        setState(() {
          _userName = docSnapshot.data()!['nome'] ??
              'Olá, ${user.email!.split('@')[0]}!';
        });
      } else {
        setState(() {
          _userName = 'Olá, ${user.email!.split('@')[0]}!';
        });
      }
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
                _userName,
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
                width: 310,
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.8, color: const Color(0xFF28928B)),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            const ScheduleAppitmentSelectDate()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.8, color: const Color(0xFF28928B)),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            const ScheduleAppitmentSelectDate()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.8, color: const Color(0xFF28928B)),
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
                            const ScheduleAppitmentSelectDate()),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        height: 115,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.8, color: const Color(0xFF28928B)),
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
                          fontWeight: FontWeight.w500,
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
                          border:
                              Border.all(width: 1.8, color: const Color(0xFF28928B)),
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
