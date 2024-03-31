import 'package:flutter/material.dart';
import 'package:mais_saude/view/historico/historico_view.dart';

class Cancelamento extends StatefulWidget {
  const Cancelamento({super.key});

  @override
  State<Cancelamento> createState() => _CancelamentoState();
}

double displayWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class _CancelamentoState extends State<Cancelamento> {
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
          'Cancelamento',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D4542),
              ),
            ),
            Text(
              'Agendamento',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D4542)),
            ),
            SizedBox(height: 18),
            Text(
              'Tem certeza que deseja CANCELAR esse agendamento? Essa ação não poderá ser desfeita.',
              style: TextStyle(fontSize: 14, color: Color(0xFF014B47)),
            ),
            const SizedBox(height: 110),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Historico()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(displayWidth(context) * 0.8, 55),
                    backgroundColor: Color(0xFF0A9080)),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Historico()),
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Manter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF014B47),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
