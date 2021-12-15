import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';

class TodoListService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final User user;
  final String path;

  TodoListService({
    required this.user,
  }) : path = 'users/${user.uid}/todoLists';

  Stream<List<TodoList>> get todoLists {
    return _db.collection(path).snapshots().map((query) {
      final List<TodoList> _todoLists = [];
      for (final doc in query.docs) {
        final note = TodoList.fromJson(doc.data());
        _todoLists.add(note);
      }

      return _todoLists;
    });
  }

  Stream<TodoList> todoList(String id) {
    final doc = _db.collection(path).doc(id);

    return doc.snapshots().map((event) {
      return TodoList.fromJson(event.data()!);
    });
  }

  Future<void> addTodoList(TodoList todoList) async {
    final doc = _db.collection(path).doc();

    final fTodoList = todoList.copyWith(id: doc.id);
    await doc.set(fTodoList.toJson());
  }

  Future<void> updateTodoList(TodoList todoList) async {
    await _db.collection(path).doc(todoList.id).update(todoList.toJson());
  }

  Future<void> removeTodoList(TodoList todoList) async {
    await _db.collection(path).doc(todoList.id).delete();
    await _db
        .collection(path)
        .doc(todoList.id)
        .collection('todos')
        .get()
        .then((value) {
      for (var element in value.docs) {
        _db
            .collection(path)
            .doc(todoList.id)
            .collection('todos')
            .doc(element.id)
            .delete();
      }
    });
  }
}
