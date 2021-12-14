import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_n_note/models/todo.dart';
import 'package:task_n_note/models/todo_list.dart';
import 'package:task_n_note/models/user.dart';

class TodoService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Todo>> todos(User user, TodoList todoList) {
    return _db
        .collection('users/${user.uid}/todoLists/${todoList.id}/todos')
        .snapshots()
        .map((query) {
      final List<Todo> todos = <Todo>[];
      for (final doc in query.docs) {
        final todo = Todo.fromMap(doc.data());
        todos.add(todo);
      }
      return todos;
    });
  }

  Future<void> addTodo(
    User user,
    TodoList todoList,
    Todo todo,
  ) async {
    final doc = _db
        .collection('users/${user.uid}/todoLists/${todoList.id}/todos')
        .doc();

    final fTodo = todo.copyWith(id: doc.id);
    await doc.set(fTodo.toMap());
  }

  Future<void> updateTodo(
    User user,
    TodoList todoList,
    Todo todo,
  ) async {
    await _db
        .collection('users/${user.uid}/todoLists/${todoList.id}/todos')
        .doc(todo.id)
        .update(todo.toMap());
  }

  Future<void> removeTodo(
    User user,
    TodoList todoList,
    Todo todo,
  ) async {
    await _db
        .collection('users/${user.uid}/todoLists/${todoList.id}/todos')
        .doc(todo.id)
        .delete();
  }

  Future<void> clearCompletedTodos(User user, TodoList todoList) async {
    final ref =
        _db.collection('users/${user.uid}/todoLists/${todoList.id}/todos');
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      final todo = Todo.fromMap(doc.data());
      if (todo.isComplete) {
        ref.doc(doc.id).delete();
      }
    }
  }

  /// Update all documents' "isComplete" value in todoList
  Future<void> toggleAllTodos(
    User user,
    TodoList todoList,
    bool toComplete,
  ) async {
    final ref =
        _db.collection('users/${user.uid}/todoLists/${todoList.id}/todos');
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      final todo = Todo.fromMap(doc.data())..isComplete = toComplete;
      ref.doc(doc.id).set(todo.toMap(), SetOptions(merge: true));
    }
  }
}
