// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../models/todo.dart';
import '../provider/tasks_model.dart';
import '../screens/edit_task_screen.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, tasksModel, child) {
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
              Container(
                height: kToolbarHeight,
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    tasksModel.currentTaskGroup.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ...tasksModel.currentTaskGroup.todos
                  .map((task) => _buildTaskItem(task))
                  .toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaskItem(Todo task) {
    return Builder(
      builder: (context) {
        return ListTile(
          leading: IconButton(
            icon: Icon(task.isComplete ? Icons.check : Icons.circle_outlined),
            onPressed: () {
              task.isComplete = !task.isComplete;

              Provider.of<TasksModel>(context, listen: false).syncChanges();
            },
          ),
          title: Text(task.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(todo: task),
              ),
            );
          },
        );
      },
    );
  }
}
