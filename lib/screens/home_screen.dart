// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_n_note/widgets/account_dialog.dart';

import '../models/todo_list.dart';
import '../screens/setting_screen.dart';
import '../widgets/add_note_fab.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/note_list_view.dart';
import '../widgets/notes_bottom_app_bar.dart';
import '../widgets/task_list_view.dart';
import '../widgets/task_lists_sheet.dart';
import '../widgets/tasks_bottom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // int currentTabIndex = 0;
  late TabController _tabController;
  late TodoList currentTaskGroup;

  /// Floating action buttons
  final fabs = [
    AddTaskFab(),
    AddNoteFab(),
  ];

  final bottomNavBars = [
    TasksBottomAppBar(),
    NotesBottomAppBar(),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(listenCurrentTabIndex);
  }

  void listenCurrentTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: _tabController.index,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Task n\' Note',
                    style: GoogleFonts.varelaRound(),
                  ),
                  pinned: true,
                  floating: true,
                  snap: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AccountDialog();
                          },
                        );
                      },
                      icon: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],
                  bottom: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'Tasks',
                      ),
                      Tab(
                        text: 'Notes',
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                TaskListView(),
                NoteListView(),
              ],
            ),
          ),
        ),
        floatingActionButton: fabs[_tabController.index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavBars[_tabController.index],
      ),
    );
  }

  void showTaskGroupSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return TaskListsSheet();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
