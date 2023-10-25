import 'package:flutter/material.dart';
import '/screens/main_screen.dart';
import '../utilities/note_manager.dart';
import 'screens/widgets/inherited.dart';

void main() {
  runApp(NoteManagerInherited(
    noteManager: NoteManager(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NoteManager noteManager = NoteManager();
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
