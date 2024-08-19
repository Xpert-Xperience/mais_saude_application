import 'package:flutter/material.dart';
import 'package:mais_saude/view/pages/home_application_view.dart';
import '../components/calendar/calendar.dart';

class ScheduleAppitmentSelectDate extends StatefulWidget {
  final String especialidade;

  const ScheduleAppitmentSelectDate({super.key, required this.especialidade});

  @override
  State<ScheduleAppitmentSelectDate> createState() =>
      _ScheduleAppitmentSelectDateState();
}

class _ScheduleAppitmentSelectDateState
    extends State<ScheduleAppitmentSelectDate> {
  @override
  Widget build(BuildContext context) {
    double displayWidth() => MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 7, 7, 7),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeApplication()),
              );
            },
          ),
        ),
        //alinhar titulo no centro
        title: const Text(
          'Marcação',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: const Color(0xff0D4542),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Center(
                child: Container(
                  width: 300,
                  height: 250,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff28928B),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              color: const Color(0xff08331E),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Dr.Lucas Davi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0D4542),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.especialidade, //Aqui o valor do text precisa ser alterado de acordo com a escolha da tela inicial
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0D4542),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            '7:00 -- 12H30', //Aqui o valor do text precisa ser alterado de acordo com a escolha da tela inicial
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0D4542),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Data da marcação',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0D4542)),
              ),
              const SizedBox(height: 10),
              Container(
                width: displayWidth() / 0.5,
                height: 360,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff014B47),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Calendar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
