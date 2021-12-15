import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/services/todo_list_service.dart';
import 'package:task_n_note/widgets/account_dialog.dart';

import '../widgets/add_todo_list_fab.dart';
import '../widgets/note/add_note_fab.dart';
import '../widgets/note/note_list_view.dart';
import '../widgets/note/notes_bottom_app_bar.dart';
import '../widgets/task/todo_list_view.dart';
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

  int currentTodoListIndex = 0;

  final bottomNavBars = [
    const TasksBottomAppBar(),
    const NotesBottomAppBar(),
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
    return MultiProvider(
      providers: [
        // 'todoLists
        StreamProvider.value(
          value: TodoListService(user: context.read<User>()).todoLists,
          initialData: const <TodoList>[],
        ),
      ],
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
                            return const AccountDialog();
                          },
                        );
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
            body: Consumer<List<TodoList>>(
              builder: (BuildContext context, todoLists, Widget? child) {
                return TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    TodoListView(
                      todoLists: todoLists,
                    ),
                    const NoteListView(),
                  ],
                );
              },
              // stream: null,
              // builder: (context, snapshot) {
              //   return TabBarView(
              //     controller: _tabController,
              //     children: const <Widget>[
              //       TaskListView(),
              //       NoteListView(),
              //     ],
              //   );
              // }
            ),
          ),
        ),
        floatingActionButton: [
          const AddTodoListFab(),
          const AddNoteFab(),
        ][_tabController.index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavBars[_tabController.index],
      ),
    );
  }

  // void showTaskGroupSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return const TaskListsSheet();
  //     },
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(10.0),
  //       ),
  //     ),
  //     isScrollControlled: true,
  //   );
  // }
}
