// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../models/todo.dart';
import '../provider/tasks_model.dart';

class EditTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Todo todo;

  EditTaskScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.indigoAccent,
        elevation: 0.0,
        // title: Text('Add Task'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
              onPressed: () {
                todo.title = titleController.text;
                todo.description = descriptionController.text;

                Provider.of<TasksModel>(context, listen: false).syncChanges();

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
