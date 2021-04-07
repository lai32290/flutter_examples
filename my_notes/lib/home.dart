import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_notes/controllers/home_controller.dart';
import 'package:my_notes/models/note.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(context),
      child: Consumer<HomeController>(
        builder: (context, controller, _) => Scaffold(
          appBar: AppBar(
            title: Text('My Notes')
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => controller.addNewNote(),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    Note note = controller.notes[index];
                    return Card(
                      child: ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                controller.handleEditNote(note);
                              }
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                controller.delete(note); 
                              }
                            ),
                          ]
                        )
                      ),
                    );
                  }
                )
              )
            ],
          )
        )
      )
    );
  }
}
