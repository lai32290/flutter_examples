import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  Database _db;

  get db async {
    if (_db != null) return _db;
    return await _initializeDatabase();
  }

  factory DatabaseService() {
    return _databaseService;
  }

  DatabaseService._internal();

  _initializeDatabase() async {
    _db = await openDatabase(
      "database.db",
      version: 1,
      onCreate: _onCreate
    ) ;
  }

  _onCreate(Database db, int version) async {
    String sql = 'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, description TEXT, createdAt DATETIME)';
    db.execute(sql);
  }

  get(String sql) async {
    return _db.rawQuery(sql);
  }
}
