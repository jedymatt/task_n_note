// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:task_n_note/models/task_group.dart';
import '../widgets/note_list_view.dart';
import '../widgets/task_group_sheet.dart';
import '../widgets/task_list_view.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<TaskGroup> taskGroups = [
    TaskGroup(title: 'My Tasks'),
  ];

  late TaskGroup currentTaskGroup;

  @override
  void initState() {
    super.initState();

    currentTaskGroup = taskGroups.first;
  }

  @override
  Widget build(BuildContext context) {
    Row currentBottomAppBarItems = Row(
      mainAxisSize: MainAxisSize.max,
      children: _getCurrentBottomAppBarItems(),
    );
    return DefaultTabController(
      length: 2,
      initialIndex: currentTabIndex,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  foregroundColor: Colors.indigoAccent,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      onPressed: () {},
                      icon: Icon(Icons.account_circle),
                    ),
                  ],
                  bottom: TabBar(
                    onTap: (value) {
                      if (currentTabIndex == value) return;

                      setState(() {
                        currentTabIndex = value;
                      });
                    },
                    labelColor: Colors.indigoAccent,
                    indicatorColor: Colors.indigoAccent,
                    indicatorSize: TabBarIndicatorSize.label,
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
              children: <Widget>[
                TaskListView(),
                NoteListView(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _moveToAddTaskScreen,
          child: Icon(Icons.add),
          backgroundColor: Colors.indigoAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: currentTabIndex == 0
            ? buildTaskBottomAppBar()
            : BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 5.0,
                child: currentBottomAppBarItems,
              ),
      ),
    );
  }

  void showTaskGroupSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return TaskGroupSheet();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _moveToAddTaskScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(),
      ),
    );
  }

  List<Widget> _getCurrentBottomAppBarItems() {
    // notes
    return [
      IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
      IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ];
  }

  Widget buildTaskBottomAppBar() {
    return Builder(builder: (context) {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: showTaskGroupSheet,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert),
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
                          // leading: Icon(Icons.done_all),
                          title: Text('Mark all as complete'),
                          onTap: () {},
                        ),
                        ListTile(
                          // leading: Icon(Icons.clear_all),
                          title: Text('Clear all completed'),
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
