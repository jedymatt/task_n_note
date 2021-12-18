import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_n_note/widgets/account_dialog.dart';

import '../widgets/add_todo_list_fab.dart';
import '../widgets/note/add_note_fab.dart';
import '../widgets/note/note_list_view.dart';
import '../widgets/task/todo_list_view.dart';
import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // int currentTabIndex = 0;
  late TabController _tabController;

  int currentTodoListIndex = 0;

  // final bottomNavBars = [
  //   const TasksBottomAppBar(),
  //   const NotesBottomAppBar(),
  // ];

  final fabs = [
    const AddTodoListFab(),
    const AddNoteFab(),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

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
                  'Task n\' Note',
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
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return const AccountDialog();
                      //   },
                      // );
                    },
                    icon: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const [
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
            children: const <Widget>[
              TodoListView(),
              NoteListView(),
            ],
          ),
        ),
      ),
      floatingActionButton: fabs[_tabController.index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // bottomNavigationBar: bottomNavBars[_tabController.index],
    );
  }
}
