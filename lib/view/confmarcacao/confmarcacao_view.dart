import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mais_saude/view/principal/principal_view.dart';

class confirmacao extends StatefulWidget {
  const confirmacao({super.key});

  @override
  State<confirmacao> createState() => _confirmacaoState();
}

class _confirmacaoState extends State<confirmacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text('Confirmação', style: TextStyle(fontSize: 25)),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
              const SizedBox(height: 40),
              const Text(
                'Sua consulta',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Text(
                'foi confirmada!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black ,fontSize: 35, fontWeight: FontWeight.bold),
                
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 10.0), 
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Foi enviado para o seu email',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Column(
                    children: [
                      Container(
                        width: 320,
                        height: 320,
                        child: Image.asset(
                          "assets/Sent Message-bro.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Principal()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: Colors.black),
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            ],
            
          ),
        ),
      ),
    );
  }
}
