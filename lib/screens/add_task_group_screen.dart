// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddTaskGroupScreen extends StatelessWidget {
  const AddTaskGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.indigoAccent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        title: Text('Create task group'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: "Save",
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: TextFormField(
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
