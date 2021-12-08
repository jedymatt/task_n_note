// Dart imports:
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:task_n_note/core/utils.dart';

import '../models/todo.dart';
import '../models/todo_list.dart';

class TasksModel extends ChangeNotifier {
  late List<TodoList> _todoLists;
  // late TodoList _currentTodoList;
  late int _currentTodoListIndex;

  TasksModel() {
    _todoLists = [
      TodoList(
        id: uuidV4(),
        title: 'My Tasks',
        todos: [],
      ),
    ];

    _currentTodoListIndex = 0;
  }

  UnmodifiableListView<TodoList> get todoLists =>
      UnmodifiableListView(_todoLists);

  TodoList get currentTodoList => _todoLists[_currentTodoListIndex];

  void addTodoList(TodoList todoList) {
    _todoLists.add(todoList);
    notifyListeners();
  }

  void removeTodoList(TodoList todoList) {
    if (!isDeletableCurrentTodoList()) {
      return;
    }

    final TodoList result =
        _todoLists.firstWhere((item) => item.id == todoList.id);

    final int indexDeleted = _todoLists.indexOf(result);

    _todoLists.remove(result);

    if (indexDeleted == _currentTodoListIndex) {
      _currentTodoListIndex -= 1;
    }

    notifyListeners();
  }

  void updateTodoList(TodoList todoList) {
    final oldTodoList = _todoLists.firstWhere((item) => item.id == todoList.id);
    final replaceIndex = _todoLists.indexOf(oldTodoList);
    _todoLists.replaceRange(replaceIndex, replaceIndex + 1, [todoList]);

    notifyListeners();
  }

  void updateCurrentTodoList(TodoList todoList) {
    updateTodoList(todoList);
    _currentTodoListIndex = _todoLists.indexOf(todoList);

    notifyListeners();
  }

  /// Add todo  in the current task group
  void addTodo(Todo todo) {
    _todoLists[_currentTodoListIndex].todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    final todoList = _todoLists[_currentTodoListIndex];
    final oldTodo = todoList.todos.firstWhere((item) => item.id == todo.id);
    final replaceIndex = todoList.todos.indexOf(oldTodo);
    todoList.todos.replaceRange(replaceIndex, replaceIndex + 1, [todo]);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todoLists[_currentTodoListIndex]
        .todos
        .removeWhere((item) => item.id == todo.id);
    notifyListeners();
  }

  void clearCompletedTodos() {
    _todoLists[_currentTodoListIndex]
        .todos
        .removeWhere((item) => item.isComplete);
    notifyListeners();
  }

  void toggleAllTodos() {
    for (var item in _todoLists[_currentTodoListIndex].todos) {
      item.isComplete = true;
    }
    notifyListeners();
  }

  /// Removes the current todo list
  void remoRemoveCurrentTodoList() {
    removeTodoList(_todoLists[_currentTodoListIndex]);
    notifyListeners();
  }

  bool isDeletableCurrentTodoList() {
    return _todoLists.length > 1 && _currentTodoListIndex > 0;
  }
}
