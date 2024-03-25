import 'package:flutter/material.dart';
import 'package:mais_saude/telas/login.dart';
class novasenha extends StatefulWidget {
  const novasenha({super.key});

  @override
  State<novasenha> createState() => _novasenhaState();
}

class _novasenhaState extends State<novasenha> {
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
              'Nova senha',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 40),
            const Text(
              'Redefina sua senha',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
             SizedBox(height: 60), 
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0), 
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Digite sua senha',
                  labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0), 
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Digite a senha novamente',
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
                MaterialPageRoute(builder: (context) => const login()),
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