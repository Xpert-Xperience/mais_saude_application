import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mais_saude/firebase_options.dart';
import 'package:mais_saude/view/pages/historic_view.dart';
import 'package:mais_saude/view/pages/profile_view.dart';
import 'package:mais_saude/view/pages/initial_presentation_view.dart';
import 'package:mais_saude/view/pages/home_application_view.dart';

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
      home: PageView(controller: pageController, children: const <Widget>[
        Scaffold(
          body: InitialPresentation(),
        ),
      ]),
      routes: {
        '/home': (context) => const HomeApplication(),
        '/historic': (context) => const Historic(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
