// Project imports:
import 'todo.dart';

class TodoList {
  String title;
  List<Todo> todos;

  TodoList({required this.title, List<Todo>? todos}) : todos = [];
}
