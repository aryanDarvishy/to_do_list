import '../../utilities/note_manager.dart';
import 'package:flutter/material.dart';

class NoteManagerInherited extends InheritedWidget {
  final NoteManager noteManager;

  const NoteManagerInherited({
    super.key,
    required super.child,
    required this.noteManager,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static NoteManagerInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoteManagerInherited>()!;
  }
}
