import 'package:flutter/material.dart';

class Informacoes extends StatefulWidget {
  const Informacoes({super.key});

  @override
  State<Informacoes> createState() => _InformacoesState();
}

class _InformacoesState extends State<Informacoes> {
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
        title: Text('Detalhes', style: TextStyle(fontSize: 25)),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}