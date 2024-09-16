import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mais_saude/view/pages/schedule/schedule_confirmation_view.dart';

class ScheduleAppoitmentSelectTime extends StatefulWidget {
  final DateTime? selectedDay;
  final String especialidade;

  const ScheduleAppoitmentSelectTime({
    super.key,
    required this.selectedDay,
    required this.especialidade,
  });

  @override
  State<ScheduleAppoitmentSelectTime> createState() =>
      _ScheduleAppoitmentSelectTimeState();
}

class _ScheduleAppoitmentSelectTimeState
    extends State<ScheduleAppoitmentSelectTime> {
  String? _selectedTime; // Variável para armazenar o horário selecionado

  Future<void> _registerConsulta() async {
    try {
      // Obtém o UID do usuário logado
      final String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) {
        throw Exception("Usuário não autenticado");
      }

      await FirebaseFirestore.instance.collection('consultas').add({
        'especialidade': widget.especialidade,
        'data': widget.selectedDay,
        'hora': _selectedTime,
        'createdAt': Timestamp.now(), // Adiciona o timestamp de criação
        'userId': userId, // Adiciona o UID do usuário
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consulta registrada com sucesso!')),
      );
      // Após o registro, redireciona para a página de confirmação
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScheduleConfirmation(
            selectedDay: widget.selectedDay!,
            especialidade: widget.especialidade,
            selectedTime: _selectedTime!,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao registrar consulta.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            'Marcar consulta em ${widget.selectedDay?.day}/${widget.selectedDay?.month}/${widget.selectedDay?.year}'),
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
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Horários disponíveis',
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
                    _buildTimeContainer(context, '13:00'),
                    _buildTimeContainer(context, '14:00'),
                    _buildTimeContainer(context, '15:00'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeContainer(context, '16:00'),
                    _buildTimeContainer(context, '17:00'),
                    _buildTimeContainer(context, '18:00'),
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
                      borderSide: const BorderSide(color: Color(0xFF28928B)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF28928B)),
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
                  onPressed: _selectedTime != null
                      ? _registerConsulta
                      : null, // Desabilita o botão se não houver horário selecionado
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

  Widget _buildTimeContainer(BuildContext context, String time) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTime = time; // Armazena o horário selecionado
        });
      },
      child: Container(
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedTime == time
                ? const Color(0xff28928B)
                : const Color(0xff0D4542),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: _selectedTime == time
              ? const Color(0xff28928B)
              : const Color(0xff0D4542),
        ),
        child: Center(
          child: Text(
            time,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
