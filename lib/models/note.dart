class Note {
  String id;
  String title;
  String content;

  Note({
    required this.id,
    required this.title,
    required this.content,
  }) : assert(title != '', content != '');

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note &&
        other.id == id &&
        other.title == title &&
        other.content == content;
  }

  Note copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  String toString() => 'Note(id: $id, title: $title, content: $content)';
}
