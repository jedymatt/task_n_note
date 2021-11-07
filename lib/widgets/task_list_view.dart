// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/task_group.dart';
import '../models/task.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaskGroup taskGroup = TaskGroup(
      'My Tasks',
      [
        Task('do 69 pushup', '', false),
        Task('do 69 pullup', '', false),
        Task('do 69km run', '', false),
        Task('buy iphone', '', false),
        Task('sell kidney', '', false),
      ],
    );

    Widget taskGroupTitleSection = Container(
      height: kTextTabBarHeight,
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

    return ListView(
      children: [
        taskGroupTitleSection,
        Divider(
          height: 1.0,
        ),
        ...taskGroup.tasks.map((task) => _buildTaskItem(task)).toList(),
      ],
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
