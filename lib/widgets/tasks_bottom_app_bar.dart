// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'task_group_sheet.dart';

class TasksBottomAppBar extends StatelessWidget {
  const TasksBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
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
            },
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      ListTile(
                        title: Text('Mark all as complete'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Clear all completed'),
                        onTap: () {},
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Rename task list'),
                        onTap: () {},
                      ),
                      // Divider(),
                      ListTile(
                        // leading: Icon(Icons.clear_all),
                        title: Text(
                          'Delete task list',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
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
  }
}
