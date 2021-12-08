// Project imports:
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'todos': todos.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoList.fromMap(Map<String, dynamic> map) {
    return TodoList(
      id: map['id'],
      title: map['title'],
      todos: List<Todo>.from(map['todos']?.map((x) => Todo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoList.fromJson(String source) =>
      TodoList.fromMap(json.decode(source));

  @override
  String toString() => 'TodoList(id: $id, title: $title, todos: $todos)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoList &&
        other.id == id &&
        other.title == title &&
        listEquals(other.todos, todos);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ todos.hashCode;
}
