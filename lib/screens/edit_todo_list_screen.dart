import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/services/auth_service.dart';
import 'package:task_n_note/services/todo_list_service.dart';

class EditTodoListScreen extends StatefulWidget {
  final TodoList todoList;
  const EditTodoListScreen({Key? key, required this.todoList})
      : super(key: key);

  @override
  State<EditTodoListScreen> createState() => _EditTodoListScreenState();
}

class _EditTodoListScreenState extends State<EditTodoListScreen> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.todoList.title;
    return StreamBuilder<User?>(
        stream: AuthService().user,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
              title: const Text('Rename task list'),
              actions: [
                IconButton(
                  onPressed: () async {
                    if (titleController.text.trim() == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cannot update an empty name'),
                        ),
                      );
                      return;
                    }

                    await TodoListService(user: snapshot.data!).updateTodoList(
                      widget.todoList
                          .copyWith(title: titleController.text.trim()),
                    );

                    Navigator.pop(context);
                  },
                  tooltip: 'Save',
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
            body: TextFormField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
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
        });
  }
}
