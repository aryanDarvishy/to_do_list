import '../utilities/note_manager.dart';

class Note {
  String title;
  String description;

  Note({
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return 'title = $title, text = $description';
  }
}
