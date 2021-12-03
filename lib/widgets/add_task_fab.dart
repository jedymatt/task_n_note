import 'package:flutter/material.dart';
import 'package:task_n_note/screens/add_task_screen.dart';

import 'components/animated_icon_fab.dart';

class AddTaskFab extends StatefulWidget {
  const AddTaskFab({Key? key}) : super(key: key);

  @override
  State<AddTaskFab> createState() => _AddTaskFabState();
}

class _AddTaskFabState extends State<AddTaskFab> {
  @override
  Widget build(BuildContext context) {
    return AnimatedIconFab(
      // key: widget.key,
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTaskScreen(),
          ),
        );
      },
    );
  }
}
