import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _getData() async {
    String dbPath = 'database.db';

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, lastVersion) {
        String sql = 'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, years_old INTEGER)';
        db.execute(sql);
      }
    );

    print(db.isOpen.toString());
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Container();
  }
}
