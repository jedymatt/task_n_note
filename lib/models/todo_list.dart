// Project imports:
import 'package:flutter/foundation.dart';

import 'todo.dart';

class TodoList {
  String id;
  String title;
  List<Todo> todos;
  TodoList({
    required this.id,
    required this.title,
    required this.todos,
  });

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ todos.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoList &&
        other.id == id &&
        other.title == title &&
        listEquals(other.todos, todos);
  }

  TodoList copyWith({
    String? id,
    String? title,
    List<Todo>? todos,
  }) {
    return TodoList(
      id: id ?? this.id,
      title: title ?? this.title,
      todos: todos ?? this.todos,
    );
  }

  @override
  String toString() => 'TodoList(id: $id, title: $title, todos: $todos)';
}
