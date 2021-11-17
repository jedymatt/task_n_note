// Project imports:
import 'todo.dart';

class TaskGroup {
  String title;
  List<Todo> todos;

  TaskGroup({required this.title, List<Todo>? todos}) : todos = [];
}
