import 'dart:convert';

class TodoList {
  String? id;
  String title;

  TodoList({
    this.id,
    required this.title,
  });

  TodoList copyWith({
    String? id,
    String? title,
  }) {
    return TodoList(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory TodoList.fromMap(Map<String, dynamic> map) {
    return TodoList(
      id: map['id'],
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoList.fromJson(String source) =>
      TodoList.fromMap(json.decode(source));

  @override
  String toString() => 'TodoList(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoList && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
