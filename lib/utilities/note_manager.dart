import '../utilities/note.dart';

class NoteManager {
  List<Note> notes = [];

  void addNote(Note note){
    notes.add(note);
  }

  void deleteNote(int index){
    notes.removeAt(index);
  }

  void changeNote(Note note, int index){
    notes[index] = note;
  }

  void printNotes() {
    for (Note note in notes) {
      print('title: ${note.title}, desc${note.description}');
    }
  }
}
