import 'task.dart';

class TaskGroup {
  String title;
  List<Task> tasks;

  TaskGroup({required this.title, List<Task>? tasks}) : tasks = [];
}
