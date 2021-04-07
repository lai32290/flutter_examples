import 'package:flutter/material.dart';
import 'package:my_notes/repositories/notes_repository.dart';
import 'package:my_notes/models/note.dart';
import 'package:flutter/foundation.dart';
import 'package:my_notes/widgets/note-form-dialog.dart';

class HomeController extends ChangeNotifier {
  List<Note> notes = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  BuildContext context;

  HomeController(BuildContext context) {
    this.context = context;
    _initState();
  }

  _initState() async {
    NotesRepository notesRepository = NotesRepository();
    notes = await notesRepository.listNotes();
    notifyListeners();
  }

  addNewNote() {
    titleController.text = '';
    descriptionController.text = '';
    NoteFormDialog.show(
      context,
      titleController: titleController,
      descriptionController: descriptionController,
      onSave: addNote
    );
  }

  handleEditNote(Note note) {
    titleController.text = note.title;
    descriptionController.text = note.description;
    NoteFormDialog.show(
      context,
      titleController: titleController,
      descriptionController: descriptionController,
      onSave: () {
        editNote(note);
      }
    );
  }

  editNote(Note note) async {
    NotesRepository notesRepository = NotesRepository();
    await notesRepository.editNote(note.id, Note(
      title: titleController.text,
      description: descriptionController.text
    ));
    await _udpateList();
    Navigator.pop(context);
    notifyListeners();
  }

  delete(Note note) async {
    NotesRepository notesRepository = NotesRepository();
    await notesRepository.deleteNote(note.id);
    await _udpateList();
    notifyListeners();
  }

  _udpateList() async {
    NotesRepository notesRepository = NotesRepository();
    notes = await notesRepository.listNotes();
  }

  addNote() async {
    NotesRepository notesRepository = NotesRepository();
    Note note = Note(
      title: titleController.text,
      description: descriptionController.text
    );
    await notesRepository.addNote(note);
    await _udpateList();
    Navigator.pop(context);
    _cleanForm();
    notifyListeners();
  }

  _cleanForm() {
    titleController.clear();
    descriptionController.clear();
  }
}
