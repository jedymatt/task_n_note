import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo_list.dart';
import '../models/user.dart';
import 'database_path.dart';

class TodoListService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late CollectionReference<Map<String, dynamic>> _ref;

  Stream<List<TodoList>> todoLists(User user) {
    _ref = _db.collection('users/${user.uid}/todoLists');

    return _ref.snapshots().map((query) {
      final List<TodoList> _todoLists = [];
      for (final doc in query.docs) {
        final note = TodoList.fromMap(doc.data());
        _todoLists.add(note);
      }

      return _todoLists;
    });
  }

  Future<void> addTodoList(User user, TodoList todoList) async {
    _ref = _db.collection(DatabasePath.todoLists(user.uid));

    final doc = _ref.doc();
    final fTodoList = todoList.copyWith(id: doc.id);
    await doc.set(fTodoList.toMap());
  }

  Future<void> updateTodoList(User user, TodoList todoList) async {
    await _db
        .collection(DatabasePath.todoLists(user.uid))
        .doc(todoList.id)
        .update(todoList.toMap());
  }

  Future<void> removeTodoList(User user, TodoList todoList) async {
    await _db
        .collection(DatabasePath.todoLists(user.uid))
        .doc(todoList.id)
        .delete();
    await _db
        .collection(DatabasePath.todoLists(user.uid))
        .doc(todoList.id)
        .collection('todos')
        .get()
        .then((value) {
      for (var element in value.docs) {
        _db
            .collection(DatabasePath.todoLists(user.uid))
            .doc(todoList.id)
            .collection('todos')
            .doc(element.id)
            .delete();
      }
    });
  }
}
