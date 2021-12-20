import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:task_n_note/models/note.dart';
import 'package:task_n_note/models/user.dart';
import 'package:task_n_note/services/database_path.dart';

class NoteService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late CollectionReference<Map<String, dynamic>> _ref;
  final User user;
  final String path;

  NoteService({
    required this.user,
  }) : path = 'users/${user.uid}/notes';

  Stream<List<Note>> get notes {
    _ref = _db.collection(DatabasePath.notes(user.uid));

    return _ref.snapshots().map((query) {
      final List<Note> _notes = [];
      for (final doc in query.docs) {
        final note = Note.fromJson(doc.data());
        _notes.add(note);
      }
      return _notes;
    });
  }

  Future<void> addNote(Note note) async {
    _ref = _db.collection(DatabasePath.notes(user.uid));

    final doc = _ref.doc();
    final fNote = note.copyWith(id: doc.id);
    doc.set(fNote.toJson());
  }

  Future<void> updateNote(Note note) async {
    _db
        .collection(DatabasePath.notes(user.uid))
        .doc(note.id)
        .update(note.toJson());
  }

  Future<void> removeNote(Note note) async {
    _db.collection(DatabasePath.notes(user.uid)).doc(note.id).delete();
  }
}
