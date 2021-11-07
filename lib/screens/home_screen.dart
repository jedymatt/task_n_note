// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_n_note/screens/task_group_edit_screen.dart';
import '../widgets/task_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
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
                Container(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.indigoAccent,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TaskGroupEditScreen(),
                    //   ),
                    // );
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            ListTile(
                              title: Text(
                                'Task List',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            ),
                            Divider(
                              height: 1.0,
                            ),
                            Expanded(
                              child: Scrollbar(
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Text('My Tasks'),
                                      selected: true,
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      title: Text('Custom tasks'),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      title: Text('Grocery'),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
