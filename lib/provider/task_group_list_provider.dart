import 'package:flutter/cupertino.dart';
import 'package:task_n_note/models/task_group.dart';

class TaskGroupListProvider extends ChangeNotifier {
  List<TaskGroup> _taskGroups = [
    TaskGroup(title: 'My Tasks'),
  ];
  int _selectedIndex = 0;

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

  void updateSelectedIndex(int newIndex) {
    if (newIndex >= _taskGroups.length) return;

    _selectedIndex = newIndex;
    notifyListeners();
  }
}
