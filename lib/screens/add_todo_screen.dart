import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/todo_list.dart';
import 'package:task_n_note/models/user.dart';
import 'package:task_n_note/services/todo_service.dart';

import '../models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  final TodoList todoList;
  const AddTodoScreen({Key? key, required this.todoList}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

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
              onPressed: () async {
                if (titleController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cannot create task without title'),
                    ),
                  );
                  return;
                }

                Todo todo = Todo(
                  title: titleController.text,
                  description: descriptionController.text,
                  isComplete: false,
                );

                TodoService(
                        user: context.read<User>(), todoList: widget.todoList)
                    .addTodo(todo);

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
