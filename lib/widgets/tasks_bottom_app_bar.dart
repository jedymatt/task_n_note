// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/provider/tasks_model.dart';
import 'package:task_n_note/screens/edit_task_list_screen.dart';

// Project imports:
import 'task_lists_sheet.dart';

class TasksBottomAppBar extends StatelessWidget {
  const TasksBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const TaskListsSheet();
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      ListTile(
                        title: const Text('Mark all as complete'),
                        onTap: () {
                          context.read<TasksModel>().toggleAllTodos();

                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Clear all completed'),
                        onTap: () {
                          context.read<TasksModel>().clearCompletedTodos();
                          Navigator.pop(context);
                        },
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Rename task list'),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTaskListScreen(),
                            ),
                          );
                        },
                      ),
                      // Divider(),
                      ListTile(
                        enabled: context.select((TasksModel model) =>
                            model.isDeletableCurrentTodoList()),
                        // leading: Icon(Icons.clear_all),

                        title: Text(
                          'Delete task list',
                          style: TextStyle(
                            color: context.select((TasksModel model) =>
                                    model.isDeletableCurrentTodoList())
                                ? Colors.red
                                : Theme.of(context).disabledColor,
                          ),
                        ),
                        onTap: () {
                          context
                              .read<TasksModel>()
                              .remoRemoveCurrentTodoList();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
                shape: const RoundedRectangleBorder(
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
