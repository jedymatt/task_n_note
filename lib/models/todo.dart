class Todo {
  String id;
  String title;
  String description;
  bool isComplete;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isComplete,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, description: $description, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isComplete == isComplete;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isComplete.hashCode;
  }
}
