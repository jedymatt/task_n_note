// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task n' Note"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_rounded),
          )
        ],
      ),
      bottomSheet: SizedBox(
        child: Container(
          color: Colors.black,
        ),
        height: 40.0,
      ),
    );
  }
}
