// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../models/todo_list.dart';
import '../provider/tasks_model.dart';
import '../screens/add_task_list_screen.dart';

class TaskGroupSheet extends StatefulWidget {
  const TaskGroupSheet({
    Key? key,
  }) : super(key: key);

  @override
  _TaskGroupSheetState createState() => _TaskGroupSheetState();
}

class _TaskGroupSheetState extends State<TaskGroupSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        // List<TaskGroup> taskGroups =
        //     Provider.of<TaskGroupListProvider>(context).taskGroups;

        // int currentIndex =
        //     Provider.of<TaskGroupListProvider>(context).selectedIndex;

        return Consumer<TasksModel>(
          builder: (context, tasksModel, child) {
            return ListView(
              controller: scrollController,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                ...tasksModel.todoLists
                    .map((taskGroup) => _buildTaskGroupTile(
                        taskGroup, taskGroup == tasksModel.currentTodoList))
                    .toList(),
                Divider(
                  thickness: 1.0,
                ),
                _buildAddTaskGroup(),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAddTaskGroup() {
    return ListTile(
      title: Text(
        'Create task list',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(Icons.add),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AddTaskListScreen();
          },
        ));
      },
    );
  }

  Widget _buildTaskGroupTile(TodoList taskGroup, bool isSelected) {
    return ListTile(
      title: Text(taskGroup.title),
      selected: isSelected,
      onTap: () {
        if (isSelected) return;
        Provider.of<TasksModel>(context, listen: false)
            .setCurrentTodoList(taskGroup);

        Navigator.pop(context);
      },
    );
  }
}
