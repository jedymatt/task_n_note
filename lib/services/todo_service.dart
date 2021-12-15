import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class TodoService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final User user;
  final TodoList todoList;
  final String path;

  TodoService({
    required this.user,
    required this.todoList,
  }) : path = 'users/${user.uid}/todoLists/${todoList.id}/todos';

  Stream<List<Todo>> get todos {
    return _db.collection(path).snapshots().map((query) {
      final List<Todo> todos = <Todo>[];
      for (final doc in query.docs) {
        final todo = Todo.fromJson(doc.data());
        todos.add(todo);
      }
      return todos;
    });
  }

  Stream<Todo> todo(String id) {
    return _db
        .collection(path)
        .doc(id)
        .snapshots()
        .map((event) => Todo.fromJson(event.data()!));
  }

  Future<void> addTodo(Todo todo) async {
    final doc = _db.collection(path).doc();

    final fTodo = todo.copyWith(id: doc.id);
    await doc.set(fTodo.toJson());
  }

  Future<void> updateTodo(Todo todo) async {
    await _db.collection(path).doc(todo.id).update(todo.toJson());
  }

  Future<void> removeTodo(Todo todo) async {
    await _db.collection(path).doc(todo.id).delete();
  }

  Future<void> clearCompletedTodos() async {
    final ref = _db.collection(path);
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      final todo = Todo.fromJson(doc.data());
      if (todo.isComplete) {
        ref.doc(doc.id).delete();
      }
    }
  }

  /// Update all documents' "isComplete" value in todoList
  Future<void> toggleAllTodos({required bool toComplete}) async {
    final ref = _db.collection(path);
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      final todo = Todo.fromJson(doc.data()).copyWith(isComplete: true);
      ref.doc(doc.id).set(todo.toJson(), SetOptions(merge: true));
    }
  }
}
