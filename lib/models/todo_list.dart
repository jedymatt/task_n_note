import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@freezed
class TodoList with _$TodoList {
  const factory TodoList({
    String? id,
    required String title,
  }) = _TodoList;

  factory TodoList.fromJson(Map<String, dynamic> json) =>
      _$TodoListFromJson(json);
}
