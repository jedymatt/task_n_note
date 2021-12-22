import 'package:flutter/material.dart';
import 'package:task_n_note/screens/todo_list/add_todo_list_screen.dart';

class AddTodoListFab extends StatefulWidget {
  const AddTodoListFab({Key? key}) : super(key: key);

  @override
  State<AddTodoListFab> createState() => _AddTodoListFabState();
}

class _AddTodoListFabState extends State<AddTodoListFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddTodoListScreen(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
