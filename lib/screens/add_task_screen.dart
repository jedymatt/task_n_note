import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils.dart';
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
        title: const Text('Add Task'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (titleController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cannot create task without title'),
                    ),
                  );
                  return;
                }

                Todo todo = Todo(
                  id: uuidV4(),
                  title: titleController.text,
                  description: descriptionController.text,
                  isComplete: false,
                );

                Provider.of<TasksModel>(context, listen: false).addTodo(todo);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Task title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
              ),
            ),
            const Divider(
              height: 0.0,
              thickness: 1.0,
              color: Colors.black12,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Task description',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                ),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                // expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
