// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import '../models/task.dart';
import '../models/task_group.dart';

class TaskGroupProvider extends ChangeNotifier {
  final TaskGroup _taskGroup;

  TaskGroupProvider(this._taskGroup);

  TaskGroup get taskGroup => _taskGroup;
  UnmodifiableListView<Task> get tasks =>
      UnmodifiableListView(_taskGroup.tasks);

  void changeTitle(String newTitle) {
    _taskGroup.title = newTitle;
    notifyListeners();
  }

  void addTask(Task task) {
    _taskGroup.tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _taskGroup.tasks.remove(task);
    notifyListeners();
  }

  void clearCompletedTask() {
    _taskGroup.tasks.clear();
    notifyListeners();
  }

  List<Task> get completedTasks =>
      _taskGroup.tasks.where((task) => task.isDone).toList();

  List<Task> get incompleteTasks =>
      _taskGroup.tasks.where((task) => !task.isDone).toList();
}
