import 'package:flutter/material.dart';
import 'package:task_n_note/screens/add_task_screen.dart';

class AddTaskFab extends StatefulWidget {
  const AddTaskFab({Key? key}) : super(key: key);

  @override
  State<AddTaskFab> createState() => _AddTaskFabState();
}

class _AddTaskFabState extends State<AddTaskFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTaskScreen(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
