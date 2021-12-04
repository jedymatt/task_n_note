// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import '../models/todo.dart';
import '../provider/tasks_model.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Todo todo = Todo(
                  id: Uuid().v4(),
                  title: titleController.text,
                  description: descriptionController.text,
                  isComplete: false,
                );

                Provider.of<TasksModel>(context, listen: false).addTodo(todo);

                Navigator.pop(context);
              },
              icon: Icon(Icons.done)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Task title'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Task description',
                ),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
