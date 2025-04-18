import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tugas3_tpm/models/user_model.dart';

class DatabaseHelper {
  static Database? _db; 
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  Future<Database> get db async {
    if(_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  } 

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user_db.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB
    );
  }

  Future<void> _createDB(Database db, int version) async{
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  //REGISTER
  Future<int> registerUser(UserModel user) async {
    final db = await this.db;
    return await db.insert('users', user.toJson());
  }

  //GET USER BY USERNAME
  Future<UserModel?> getUserByUsername(String username) async {
    final db = await this.db;
    List<Map<String, dynamic>> result = await db.query( 'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    } else {
      return null;
    }
  }
  
  //LOGIN
  Future<UserModel?> loginUser(String username, String password) async {
    final db = await this.db;
    List<Map<String, dynamic>> result = await db.query( 'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    } else {
      return null;
    }
  }
}