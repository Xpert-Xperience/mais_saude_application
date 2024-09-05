import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mais_saude/model/fila_model.dart'; // O modelo criado acima
import 'dart:math';

class CheckinController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para cancelar check-in do usuário
  Future<void> cancelarCheckin(String userId) async {
    final filaRef = _firestore.collection('filas').doc(userId);
    final snapshot = await filaRef.get();

    if (snapshot.exists) {
      await filaRef.delete();
    } else {
      throw Exception("Usuário não está na fila.");
    }
  }

  // Método para gerar senha de três dígitos
  String _gerarSenha() {
    final random = Random();
    return (100 + random.nextInt(900)).toString(); // Gera um número entre 100 e 999
  }

  // Método para realizar check-in do usuário
  Future<void> fazerCheckin(String userId) async {
    final filaRef = _firestore.collection('filas').doc(userId);
    final snapshot = await filaRef.get();

    if (!snapshot.exists) {
      final senha = _gerarSenha();
      final pessoasEsperando = await _calcularPessoasEsperando();
      final tempoEstimado = pessoasEsperando * 40; // 40 minutos por pessoa

      await filaRef.set({
        'ficha': senha,
        'pessoasEsperando': pessoasEsperando,
        'tempoEstimado': tempoEstimado,
      });
    } else {
      throw Exception("Usuário já fez check-in.");
    }
  }

  // Método para calcular a quantidade de pessoas esperando
  Future<int> _calcularPessoasEsperando() async {
    final querySnapshot = await _firestore.collection('filas').get();
    return querySnapshot.size;
  }

  Stream<FilaConsulta> getFilaConsultaStream(String userId) {
    return _firestore.collection('filas').doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return FilaConsulta.fromMap(snapshot.data()!);
      } else {
        throw Exception("Documento não encontrado ou vazio");
      }
    });
  }
}