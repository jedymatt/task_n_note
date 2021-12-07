// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';

import '../provider/tasks_model.dart';

class EditTaskListScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  EditTaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    titleController.text = context.read<TasksModel>().currentTodoList.title;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        title: Text('Rename task list'),
        actions: [
          IconButton(
            onPressed: () {
              if (titleController.text.trim() == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Cannot update an empty name'),
                  ),
                );
                return;
              }

              final model = context.read<TasksModel>();

              model.updateTodoList(
                model.currentTodoList.copyWith(
                  title: titleController.text.trim(),
                ),
              );
              log('model.currentTodoList.title = ${model.currentTodoList.title}\n'
                  'titleController.text.trim() = ${titleController.text.trim()}');
              Navigator.pop(context);
            },
            tooltip: 'Save',
            icon: Icon(Icons.save),
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
