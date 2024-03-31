import 'package:flutter/material.dart';

class Cancelamento extends StatefulWidget {
  const Cancelamento({super.key});

  @override
  State<Cancelamento> createState() => _CancelamentoState();
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
        title: Text('Cancelamento', style: TextStyle(fontSize: 25)),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}