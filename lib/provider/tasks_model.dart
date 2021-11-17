// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/material.dart';
import '../models/todo.dart';

// Project imports:
import '../models/task_group.dart';

class TasksModel extends ChangeNotifier {
  late List<TaskGroup> _taskGroups;
  late TaskGroup _currentTaskGroup;

  TasksModel() {
    _taskGroups = [
      TaskGroup(title: 'My Tasks'),
    ];

    _currentTaskGroup = _taskGroups.first;
  }

  UnmodifiableListView<TaskGroup> get taskGroups =>
      UnmodifiableListView(_taskGroups);

  TaskGroup get currentTaskGroup => _currentTaskGroup;

  void addTaskGroup(TaskGroup taskGroup) {
    _taskGroups.add(taskGroup);
    notifyListeners();
  }

  void removeTaskGroup(TaskGroup taskGroup) {
    _taskGroups.remove(taskGroup);
    notifyListeners();
  }

  void updateTaskGroupByIndex(int index, TaskGroup newTaskGroup) {
    _taskGroups[index] = newTaskGroup;
    notifyListeners();
  }

  void updateTaskGroup(TaskGroup oldTaskGroup, TaskGroup newTaskGroup) {
    int index = _taskGroups.indexOf(oldTaskGroup);
    _taskGroups[index] = newTaskGroup;
    notifyListeners();
  }

  void updateCurrentTaskGroup(TaskGroup newCurrentTaskGroup) {
    _currentTaskGroup = newCurrentTaskGroup;
    notifyListeners();
  }

  void syncChanges() {
    notifyListeners();
  }

  /// Add todo  in the current task group
  void addTodo(Todo todo) {
    _currentTaskGroup.todos.add(todo);
    notifyListeners();
  }
}
