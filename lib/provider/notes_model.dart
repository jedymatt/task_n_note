// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../models/task_group.dart';

class NotesModel extends ChangeNotifier {
  late List<TaskGroup> _taskGroups;
  late int _selectedIndex = 0;

  late TaskGroup _currentTaskGroup;

  NotesModel() {
    _taskGroups = [
      TaskGroup(title: 'My Tasks'),
    ];

    _currentTaskGroup = _taskGroups.first;
  }

  get taskGroups => _taskGroups;

  get selectedIndex => _selectedIndex;

  void addTaskGroup(TaskGroup taskGroup) {
    _taskGroups.add(taskGroup);
    notifyListeners();
  }

  void removeTaskGroup(TaskGroup taskGroup) {
    _taskGroups.remove(taskGroup);
    notifyListeners();
  }

  void updateTaskGroup(TaskGroup taskGroup) {}

  void updateSelectedIndex(int newIndex) {
    if (newIndex >= _taskGroups.length) return;

    _selectedIndex = newIndex;
    notifyListeners();
  }
}
