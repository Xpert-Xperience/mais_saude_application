import 'package:flutter/material.dart';
import 'package:mais_saude/telas/cadastro.dart';
import 'package:mais_saude/telas/confesq.dart';
import 'package:mais_saude/telas/inicial.dart';
import 'package:mais_saude/telas/login.dart';
import 'package:mais_saude/telas/novaSenha.dart';
import 'package:mais_saude/telas/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pageController = PageController(initialPage: 1);

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem vindo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home: PageView(
      controller: pageController,
      children: <Widget>[
        const Scaffold(
          body: login(),
        ),
         Scaffold(
          body: inicial(pageController),
        ), 
        const Scaffold(
          body: cadastro(),
        ),
        const Scaffold(
          body: confesq(),
        ),
         const Scaffold(
          body: principal(),
        ),
        const Scaffold(
          body: novasenha(),
        ),
      ]
     )
    );
  }
}


