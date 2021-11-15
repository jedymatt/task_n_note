// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../models/task.dart';
import '../models/task_group.dart';

class TaskListView extends StatelessWidget {
  final TaskGroup taskGroup;

  const TaskListView({Key? key, required this.taskGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget taskGroupTitleSection = Container(
      height: kToolbarHeight,
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          taskGroup.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

    return Scrollbar(
      interactive: true,
      child: ListView(
        shrinkWrap: true,
        // padding: EdgeInsets.only(top: 0.0),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          taskGroupTitleSection,
          ...taskGroup.tasks.map((task) => _buildTaskItem(task)).toList(),
        ],
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    return ListTile(
      leading: IconButton(
        icon: Icon(task.isDone ? Icons.check : Icons.circle_outlined),
        onPressed: () {},
      ),
      title: Text(task.title),
      onTap: () {},
    );
  }
}
