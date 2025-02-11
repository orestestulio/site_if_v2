import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper._internal();

  //define um getter assíncrono
  //Se _db já existir, ela é retornada imediatamente usando return _db!;. O operador ! é usado para afirmar que _db não é null.
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  //Inicializa o banco de dados
  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "app_database.db");

    //Abre o banco de dados se existir
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //Se não existir é criado aqui
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        curso TEXT NOT NULL
      )
    ''');
  }

  // Cria um novo usuário
  Future<int> createUser(String nome, String curso) async {
    final database = await db;
    return await database.insert('usuarios', {
      'nome': nome,
      'curso': curso,
    });
  }

  // Busca um usuário pelo nome (retorna o primeiro que encontrar)
  Future<Map<String, dynamic>?> getUserByName(String nome) async {
    final database = await db;
    final result = await database.query(
      'usuarios',
      where: 'nome = ?',
      whereArgs: [nome],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
