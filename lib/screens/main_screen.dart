import 'package:flutter/material.dart';
import 'widgets/inherited.dart';
import '../utilities/note_manager.dart';
import '../utilities/note.dart';
import '../screens/task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pos = 0;
  String title = '';


  @override
  Widget build(BuildContext context) {
    NoteManager noteManager = NoteManagerInherited.of(context).noteManager;

    title = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskScreen(
                  position: -1,
                ),
              ),
            ).then((result) {
              if (result != null) {
                addNoteAndRefresh();
              }
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: noteManager.notes.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  noteManager.notes[index].title,
                  style: const TextStyle(fontSize: 30),
                ),
                onTap: ()  {
                  pos = noteManager.notes.indexOf(noteManager.notes[index]);
                   editNotes(pos);
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }

  void editNotes(int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TaskScreen(position: index))).then((value){
          setState(() {
            NoteManagerInherited.of(context).noteManager;
          });
    });
  }

  // Новый метод для обновления интерфейса после добавления заметки
  void addNoteAndRefresh() {
    setState(() {
      NoteManagerInherited.of(context).noteManager;
    });
  }
}
