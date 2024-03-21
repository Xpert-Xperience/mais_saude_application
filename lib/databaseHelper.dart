// ignore: file_names
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart' show Database, getDatabasesPath, openDatabase;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'registration.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        matricula TEXT,
        nome TEXT,
        email TEXT,
        telefone TEXT,
        senha TEXT
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('users');
  }

  Future<void> printUsers() async {
    Database db = await database;
    List<Map<String, dynamic>> users = await db.query('users');
    for (Map<String, dynamic> user in users) {
      print('User: ${user['id']}, ${user['matricula']}, ${user['nome']}, ${user['email']}, ${user['telefone']}, ${user['senha']}');
    }
  }
}