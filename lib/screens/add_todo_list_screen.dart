// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/services/todo_list_service.dart';

class AddTodoListScreen extends StatefulWidget {
  const AddTodoListScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoListScreen> createState() => _AddTodoListScreenState();
}

class _AddTodoListScreenState extends State<AddTodoListScreen> {
  final TextEditingController _title = TextEditingController();

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
              final String trimmedTitle = _title.text.trim();

              if (trimmedTitle.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Cannot create an empty name'),
                  ),
                );
                return;
              }

              TodoList todoList = TodoList(
                title: trimmedTitle,
              );

              TodoListService(user: context.read<User>()).addTodoList(todoList);

              Navigator.pop(context);
            },
            tooltip: 'Add',
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: TextFormField(
        controller: _title,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          hintText: 'Enter task list title',
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
              
      
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       onPressed: () => Navigator.pop(context),
    //       icon: Icon(Icons.close),
    //     ),
    //     title: Text('Create task list'),
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           if (_title.text.trim() == '') {
    //             ScaffoldMessenger.of(context).showSnackBar(
    //               SnackBar(
    //                 content: Text('Cannot create an empty name'),
    //               ),
    //             );
    //             return;
    //           }

    //           TodoList todoList = TodoList(
    //             title: _title.text.trim(),
    //           );

    //           TodoListService(user: context.read<User>()).addTodoList(todoList);

    //           Navigator.pop(context);
    //         },
    //         tooltip: 'Add',
    //         icon: Icon(Icons.add),
    //       ),
    //     ],
    //   ),
    //   body: TextFormField(
    //     controller: _title,
    //     autofocus: true,
    //     decoration: InputDecoration(
    //       contentPadding: EdgeInsets.all(15.0),
    //       hintText: 'Enter task list title',
    //       focusedBorder: UnderlineInputBorder(
    //         borderSide: BorderSide(
    //           color: Colors.black12,
    //         ),
    //       ),
    //       border: UnderlineInputBorder(
    //         borderSide: BorderSide(
    //           color: Colors.black12,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  

        
  