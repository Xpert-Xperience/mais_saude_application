import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/schedule_confirmation_view.dart';

class ScheduleAppoitmentSelectTime extends StatefulWidget {
  const ScheduleAppoitmentSelectTime({super.key});

  @override
  State<ScheduleAppoitmentSelectTime> createState() =>
      _ScheduleAppoitmentSelectTimeState();
}

class _ScheduleAppoitmentSelectTimeState
    extends State<ScheduleAppoitmentSelectTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF136A65),
        leading: Container(
          decoration: const BoxDecoration(),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text('Detalhes', style: TextStyle(fontSize: 25)),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Horarios disponiveis',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff014B47)),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xff0D4542), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D4542)),
                      child: const Center(
                        child: Text(
                          '13:00',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xff0D4542), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D4542)),
                      child: const Center(
                        child: Text(
                          '14:00',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xff0D4542), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D4542)),
                      child: const Center(
                        child: Text(
                          '15:00',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xff0D4542), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D4542)),
                      child: const Center(
                        child: Text(
                          '16:00',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xff0D4542), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D4542)),
                      child: const Center(
                        child: Text(
                          '17:00',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: const Color(0xff0D4542), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff0D4542)),
                      child: const Center(
                        child: Text(
                          '18:00',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Responda abaixo caso seja atleta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Modalidade',
                    labelStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(
                              0xFF28928B)), // Definindo a cor da borda quando não está em foco
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(
                              0xFF28928B)), // Definindo a cor da borda quando está em foco
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Descreva seu problema',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Container(
                width: 320,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff28928B)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScheduleConfirmation()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      backgroundColor: const Color(0xff0A9080)),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255)),
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
