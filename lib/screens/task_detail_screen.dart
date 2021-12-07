import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../provider/tasks_model.dart';
import '../widgets/text_button_toggle.dart';

class TaskDetailScreen extends StatefulWidget {
  final Todo todo;

  const TaskDetailScreen({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isEdited = false;
  late bool isTaskComplete;

  @override
  void initState() {
    titleController.text = widget.todo.title;
    descriptionController.text = widget.todo.description;
    isTaskComplete = widget.todo.isComplete;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<TasksModel>(context, listen: false)
                    .removeTodo(widget.todo);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormField(
              enabled: !widget.todo.isComplete,
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Task title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
              ),
              style: isTaskComplete
                  ? TextStyle(
                      color: Theme.of(context).disabledColor,
                    )
                  : null,
              onChanged: (value) {
                setState(() {
                  if (titleController.text == widget.todo.title) {
                    isEdited = false;
                  } else {
                    isEdited = true;
                  }
                });
              },
            ),
            const Divider(
              height: 0.0,
              thickness: 1.0,
              color: Colors.black12,
            ),
            SizedBox(
              child: TextFormField(
                enabled: !widget.todo.isComplete,
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Task description',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),

                  // enabled: !isTaskComplete,
                ),
                style: isTaskComplete
                    ? TextStyle(
                        color: Theme.of(context).disabledColor,
                      )
                    : null,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    if (descriptionController.text == widget.todo.description) {
                      isEdited = false;
                    } else {
                      isEdited = true;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isEdited
          ? FloatingActionButton(
              onPressed: () {
                final updatedTodo = widget.todo.copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                );

                context.read<TasksModel>().updateTodo(updatedTodo);

                final snackBar = SnackBar(
                  content: const Text('Task updated!'),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pop(context);
              },
              child: const Icon(Icons.save),
            )
          : null,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButtonToggle(
                value: widget.todo.isComplete,
                child: const Text('Mark as incomplete'),
                childFallback: const Text('Mark as complete'),
                onPressed: (value) {
                  final updatedTodo = widget.todo.copyWith(
                    isComplete: value,
                  );
                  context.read<TasksModel>().updateTodo(updatedTodo);
                  setState(() {
                    isTaskComplete = value;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
