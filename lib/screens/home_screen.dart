// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_n_note/widgets/note_list.dart';
import 'package:task_n_note/widgets/task_drawer.dart';
import '../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentListIndex = 0;
  final List<Widget> _lists = [
    TaskList(),
    NoteList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentListIndex == 0)
          ? AppBar(
              // title: Text('My Tasks'),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            ListTile(
                              leading: Icon(Icons.done_all),
                              title: Text('Mark all as complete'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: Icon(Icons.clear_all),
                              title: Text('Clear all completed'),
                              onTap: () {},
                            ),
                          ],
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            )
          : null,
      drawer: (_currentListIndex == 0)
          ? Drawer(
              child: SafeArea(
                child: TaskDrawer(),
              ),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentListIndex,
        onTap: (value) {
          setState(() {
            _currentListIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Tasks',
            icon: Icon(Icons.task_alt_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Notes',
            icon: Icon(Icons.notes),
          ),
        ],
      ),
      body: _lists[_currentListIndex],
    );
  }
}
