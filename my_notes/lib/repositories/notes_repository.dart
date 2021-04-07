import 'package:sqflite/sqflite.dart';
import 'package:my_notes/repositories/database_repository.dart';
import 'package:my_notes/models/note.dart';

class NotesRepository {
  String _tableName = 'notes';

  addNote(Note note) async {
    DatabaseRepository databaseRepository = DatabaseRepository();
    Database db = await databaseRepository.db;
    await db.insert(_tableName, note.toMap());
  }

  Future<List<Note>> listNotes() async {
    DatabaseRepository databaseRepository = DatabaseRepository();
    Database db = await databaseRepository.db;
    List result = await db.query(_tableName);

    List<Note> notes = result.map((item) => Note.fromJSON(item)).toList();
    return notes;
  }

  Future deleteNote(int id) async {
    DatabaseRepository databaseRepository = DatabaseRepository();
    Database db = await databaseRepository.db;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future editNote(int id, Note note) async {
    DatabaseRepository databaseRepository = DatabaseRepository();
    Database db = await databaseRepository.db;
    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}
