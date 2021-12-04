// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import '../models/todo.dart';
import '../models/todo_list.dart';

class TasksModel extends ChangeNotifier {
  final uuid = const Uuid();
  late List<TodoList> _todoLists;
  late TodoList _currentTodoList;

  TasksModel() {
    _todoLists = [
      TodoList(
        id: uuid.v4(),
        title: 'My Tasks',
        todos: [],
      ),
    ];

    _currentTodoList = _todoLists.first;
  }

  UnmodifiableListView<TodoList> get todoLists =>
      UnmodifiableListView(_todoLists);

  TodoList get currentTodoList => _currentTodoList;

  void addTodoList(TodoList todoList) {
    _todoLists.add(todoList);
    notifyListeners();
  }

  void removeTodoList(TodoList todoList) {
    _todoLists.remove(todoList);
    notifyListeners();
  }

  // void updateTaskGroupByIndex(int index, TodoList newTaskGroup) {
  //   _todoLists[index] = newTaskGroup;
  //   notifyListeners();
  // }

  // void updateTaskGroup(TodoList oldTaskGroup, TodoList newTaskGroup) {
  //   int index = _todoLists.indexOf(oldTaskGroup);
  //   _todoLists[index] = newTaskGroup;
  //   notifyListeners();
  // }

  void setCurrentTodoList(TodoList todoList) {
    _currentTodoList = todoList;
    notifyListeners();
  }

  void syncChanges() {
    notifyListeners();
  }

  /// Add todo  in the current task group
  void addTodo(Todo todo) {
    _currentTodoList.todos.add(todo);
    notifyListeners();
  }
}
