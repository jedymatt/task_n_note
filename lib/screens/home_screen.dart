import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_n_note/widgets/animated_fab.dart';

import '../widgets/add_todo_list_fab.dart';
import '../widgets/note/add_note_fab.dart';
import '../widgets/note/note_list_view.dart';
import '../widgets/todo_list/todo_list_view.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentViewIndex = 0;

  final views = const [
    TodoListView(),
    NoteListView(),
  ];

  final fabs = [
    const AddTodoListFab(),
    const AddNoteFab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  widget.title,
                  style: GoogleFonts.varelaRound(),
                ),
                pinned: true,
                floating: true,
                snap: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
                    },
                    icon: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
            ];
          },
          body: views[currentViewIndex],
        ),
      ),
      floatingActionButton: AnimatedFab(
        child: fabs[currentViewIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentViewIndex,
        onTap: (value) {
          setState(() {
            currentViewIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}
