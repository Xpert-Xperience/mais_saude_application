import 'package:flutter/material.dart';
import 'package:mais_saude/controller/login_controller.dart';
import 'package:mais_saude/view/components/custom_bottom_navigation_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.25,
              color: const Color(0xFF0D4542),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.07),
                  _buildTextField("Email", "chiquin@gmail.com", screenWidth),
                  _buildTextField("Matrícula", "123456", screenWidth),
                  _buildTextField("Celular", "85998876543", screenWidth),
                  SizedBox(height: screenHeight * 0.04),
                  _logoutBtn(context, screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }

  Widget _buildTextField(String labelText, String value, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          width: screenWidth,
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff28928B), width: 1.8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _logoutBtn(BuildContext context, double screenWidth) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A9080),
          minimumSize: Size(screenWidth * 0.5, 45),
        ),
        onPressed: () {
          _controller.userLogout(context);
        },
        child: const Text(
          'Logout',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
