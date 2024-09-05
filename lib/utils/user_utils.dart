import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getCurrentUserName() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user.uid)
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()!['nome'] ?? 'Olá, ${user.email!.split('@')[0]}!';
    } else {
      return 'Olá, ${user.email!.split('@')[0]}!';
    }
  }
  return 'Usuário não encontrado';
}
