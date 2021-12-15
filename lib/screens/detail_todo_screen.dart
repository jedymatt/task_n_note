import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/services/todo_service.dart';

import '../widgets/text_button_toggle.dart';

class DetailTodoScreen extends StatefulWidget {
  final Todo todo;

  const DetailTodoScreen({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<DetailTodoScreen> createState() => _DetailTodoScreenState();
}

class _DetailTodoScreenState extends State<DetailTodoScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  bool isEdited = false;
  late bool isTaskComplete;

  @override
  void initState() {
    _title.text = widget.todo.title;
    _description.text = widget.todo.description;
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
                TodoService(
                  user: context.read<User>(),
                  todoList: context.read<TodoList>(),
                ).removeTodo(widget.todo);
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
              controller: _title,
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
                  if (_title.text == widget.todo.title) {
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
                controller: _description,
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
                    if (_description.text == widget.todo.description) {
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
                final todo = widget.todo.copyWith(
                  title: _title.text,
                  description: _description.text,
                );
                TodoService(
                  user: context.read<User>(),
                  todoList: context.read<TodoList>(),
                ).updateTodo(todo);

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
                  final todo = widget.todo.copyWith(
                    isComplete: value,
                  );

                  TodoService(
                    user: context.read<User>(),
                    todoList: context.read<TodoList>(),
                  ).updateTodo(todo);

                  // setState(() {
                  //   isTaskComplete = value;
                  // });
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
