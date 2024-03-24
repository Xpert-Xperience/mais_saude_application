import 'package:mais_saude/services/database_service.dart';

class DatabaseHelper {
  final DatabaseService _databaseHelper = DatabaseService();

  Future<bool> login(String username, String password) async {
    List<Map<String, dynamic>> users = await _databaseHelper.getUsers();
   for (Map<String, dynamic> user in users) {
      // Verifica se os dados recebidos correspondem ao usuário no banco de dados
      if (user['matricula'].trim() == username.trim() &&
          user['senha'] == password) {
        return true; // Username and password match
      }
    }
    return false; // Username or password incorrect
  }
}
