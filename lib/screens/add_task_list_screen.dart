// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import '../models/todo_list.dart';
import '../provider/tasks_model.dart';

class AddTaskListScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  AddTaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        title: Text('Create task list'),
        actions: [
          IconButton(
            onPressed: () {
              if (titleController.text.trim() == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Cannot create an empty name'),
                  ),
                );
                return;
              }

              TodoList taskGroup = TodoList(
                id: const Uuid().v4(),
                title: titleController.text.trim(),
                todos: [],
              );

              Provider.of<TasksModel>(context, listen: false)
                  .addTodoList(taskGroup);

              Navigator.pop(context);
            },
            tooltip: 'Add',
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TextFormField(
        controller: titleController,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          hintText: 'Enter task group title',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
      ),
    );
  }
}
