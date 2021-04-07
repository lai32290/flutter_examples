import 'package:flutter/material.dart';


class NoteFormDialog {
  static show(BuildContext context, {
    TextEditingController titleController,
    TextEditingController descriptionController,
    Function onSave,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'type your note title...',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Note',
                  hintText: 'type your note...',
                ),
                controller: descriptionController,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: onSave
            )
          ]
        );
      }
    );
  }
}
