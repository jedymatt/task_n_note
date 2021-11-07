// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TaskGroupEditScreen extends StatelessWidget {
  const TaskGroupEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        foregroundColor: Colors.indigoAccent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('My Tasks'),
            selected: true,
          ),
          ListTile(
            title: Text('Custom tasks'),
          ),
          ListTile(
            title: Text('Grocery'),
          ),
        ],
      ),
    );
  }
}
