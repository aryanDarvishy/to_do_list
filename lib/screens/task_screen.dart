import 'package:flutter/material.dart';
import 'widgets/inherited.dart';
import '../utilities/note_manager.dart';
import '../utilities/note.dart';
import '../screens/main_screen.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key, required this.position});

  int position;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool validForm = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NoteManager noteManager = NoteManagerInherited.of(context).noteManager;
    int position = widget.position;

    if (position != -1) {
      print(1);
      Note note = noteManager.notes[position];
      titleController.text = note.title;
      descriptionController.text = note.description;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteManager.deleteNote(position);
          Navigator.pop(context);
        },
        child: const Icon(Icons.delete),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Note note = createNewNote(
                  titleController.text, descriptionController.text);
              validForm =
                  isLaunched(titleController.text, descriptionController.text);
              if (validForm) {
                if (position == -1) {
                  noteManager.addNote(note);
                } else {
                  noteManager.changeNote(note, position);
                }
                Navigator.pop(context, note);
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 30),
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: 'Create a name',
                  hintStyle: TextStyle(fontSize: 30)),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: descriptionController,
                style: const TextStyle(fontSize: 20),
                maxLines: null,
                decoration: const InputDecoration(hintText: 'Write a task'),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isLaunched(String title, String desc) {
    if (title == '' || title.isEmpty || desc.isEmpty || desc == '') {
      return false;
    } else {
      return true;
    }
  }

  Note createNewNote(String title, String desc) {
    Note note = Note(
      title: title,
      description: desc,
    );
    return note;
  }
}
