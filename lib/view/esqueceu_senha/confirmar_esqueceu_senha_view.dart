import 'package:flutter/material.dart';
import 'package:mais_saude/view/esqueceu_senha/novaSenha.dart';

class ConfirmarEsqueceuSenha extends StatefulWidget {
  const ConfirmarEsqueceuSenha({super.key});

  @override
  State<ConfirmarEsqueceuSenha> createState() => _ConfirmarEsqueceuSenhaState();
}

class _ConfirmarEsqueceuSenhaState extends State<ConfirmarEsqueceuSenha> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: _page(),
      ),
    );
  }
Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Container(
                      width: 40, 
                      height: 40, 
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0), 
                        shape: BoxShape.rectangle, 
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                          ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
              ],
            ),
const SizedBox(height: 60), 
            const Text(
              'Esqueceu a',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
            ),const Text(
              'Senha?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Digite seu email utilizado no cadastro para receber um \nlink de recuperação',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
             SizedBox(height: 60), 
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0), 
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 60), 
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NovaSenha()),
              );
},
                style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                 backgroundColor: Colors.black
              ),
              child: Text(
                'Confirmar',
                style: TextStyle(fontSize: 22, color: const Color.fromARGB(255, 255, 255, 255)), 
              ),
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child:  Text(
                'Cancelar',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 20, 20, 20)), 
                )
              )
          ],
        ),
      ),
    );
  }
}