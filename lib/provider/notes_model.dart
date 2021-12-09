import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/note.dart';

class NotesModel extends ChangeNotifier {
  late List<Note> _notes;
  NotesModel() {
    _notes = [];
  }

  UnmodifiableListView<Note> get notes => UnmodifiableListView<Note>(_notes);

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    final oldNote = _notes.firstWhere((item) => item.id == note.id);
    final replaceIndex = _notes.indexOf(oldNote);
    _notes.replaceRange(replaceIndex, replaceIndex + 1, [note]);
    notifyListeners();
  }

  void removeNote(Note note) {
    _notes.removeWhere((item) => item.id == note.id);
    notifyListeners();
  }
}
