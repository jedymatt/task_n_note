// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:task_n_note/screens/add_task_group_screen.dart';
import '../models/task_group.dart';

class TaskGroupSheet extends StatefulWidget {
  final List<TaskGroup> taskGroups;
  final int currentTaskGroupIndex;

  const TaskGroupSheet({
    Key? key,
    required this.taskGroups,
    required this.currentTaskGroupIndex,
  }) : super(key: key);

  @override
  _TaskGroupSheetState createState() => _TaskGroupSheetState();
}

class _TaskGroupSheetState extends State<TaskGroupSheet> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.currentTaskGroupIndex;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            SizedBox(
              height: 10.0,
            ),
            ...widget.taskGroups
                .map((taskGroup) => _buildTaskGroupTile(taskGroup))
                .toList(),
            Divider(
              thickness: 1.0,
            ),
            _buildAddTaskGroup(),
          ],
        );
      },
    );
  }

  Widget _buildAddTaskGroup() {
    return ListTile(
      title: Text(
        'Create task group',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(Icons.add),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AddTaskGroupScreen();
          },
        ));
      },
    );
  }

  Widget _buildTaskGroupTile(TaskGroup taskGroup) {
    return ListTile(
      title: Text(taskGroup.title),
      selected: widget.taskGroups.indexOf(taskGroup) == currentIndex,
      onTap: () {
        setState(() {
          currentIndex = widget.taskGroups.indexOf(taskGroup);
        });
      },
    );
  }
}
