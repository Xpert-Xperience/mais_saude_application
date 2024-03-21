import 'package:mais_saude/databaseHelper.dart';

class DatabaseService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<bool> login(String username, String password) async {
    List<Map<String, dynamic>> users = await _databaseHelper.getUsers();
    for (Map<String, dynamic> user in users) {
      if (user['matricula'] == username && user['senha'] == password) {
        return true; // Username and password match
      }
    }
    return false; // Username or password incorrect
  }
}
