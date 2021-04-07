import 'package:sqflite/sqflite.dart';

class DatabaseRepository {

  static final DatabaseRepository _databaseRepository = DatabaseRepository._internal();

  Database _db;

  get db async {
    if (_db != null) return _db;
    return await _initializeDatabase();
  }

  factory DatabaseRepository() {
    return _databaseRepository;
  }

  DatabaseRepository._internal();

  _initializeDatabase() async {
    _db = await openDatabase(
      "database.db",
      version: 1,
      onCreate: _onCreate
    );
    return _db;
  }

  _onCreate(Database db, int version) async {
    String sql = 'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, description TEXT, createdAt DATETIME)';
    db.execute(sql);
  }
}
