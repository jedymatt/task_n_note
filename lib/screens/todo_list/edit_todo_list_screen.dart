import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/services/todo_list_service.dart';
import 'package:task_n_note/widgets/single_line_input_field.dart';

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
  void initState() {
    super.initState();
    titleController.text = widget.todoList.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text('Rename task list'),
        actions: [
          IconButton(
            onPressed: () {
              if (titleController.text.trim() == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cannot update an empty name'),
                  ),
                );
                return;
              }

              TodoListService(user: context.read<User>()).updateTodoList(
                widget.todoList.copyWith(title: titleController.text.trim()),
              );

              Navigator.pop(context);
            },
            tooltip: 'Save',
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleLineInputField(
        controller: titleController,
        hintText: 'Enter task group title',
        autofocus: true,
      ),
    );
  }
}
