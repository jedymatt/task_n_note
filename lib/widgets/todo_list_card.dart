import 'package:flutter/material.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/screens/detail_todo_list_screen.dart';

class TodoListCard extends StatefulWidget {
  final TodoList todoList;
  const TodoListCard({Key? key, required this.todoList}) : super(key: key);

  @override
  State<TodoListCard> createState() => _TodoListCardState();
}

class _TodoListCardState extends State<TodoListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(width: 1.0, color: Colors.black12),
      ),
      elevation: 0.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailTodoListScreen(
                todoList: widget.todoList,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.todoList.title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
