import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/firebase_options.dart';
import 'package:mais_saude/view/cadastro/cadastro_view.dart';
import 'package:mais_saude/view/esqueceu_senha/confirmar_esqueceu_senha_view.dart';
import 'package:mais_saude/view/inicio/inicio_view.dart';
import 'package:mais_saude/view/login/login_view.dart';
import 'package:mais_saude/view/principal/principal_view.dart';

Future<void> main() async {
  runApp(MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
          body: LoginView(),
        ),
         Scaffold(
          body: inicial(pageController),
        ), 
        const Scaffold(
          body: CadastroView(),
        ),
        const Scaffold(
          body: ConfirmarEsqueceuSenha(),
        ),
         const Scaffold(
          body: Principal(),
        ),
      ]
     )
    );
  }
}


