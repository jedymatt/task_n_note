import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/screens/edit_todo_list_screen.dart';

@Deprecated('No Longer used')
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
              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) {
              //     return const TaskListsSheet();
              //   },
              //   shape: const RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(10.0),
              //     ),
              //   ),
              //   isScrollControlled: true,
              // );
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
                        onTap: () async {
                          // context.read<TasksModel>().toggleAllTodos();
                          // await context.read<TodoService>().toggleAllTodos(
                          //       context.read<User>(),
                          //       context.read<TodoListValueModel>().value!,
                          //       true,
                          //     );
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Clear all completed'),
                        onTap: () async {
                          // context.read<TasksModel>().clearCompletedTodos();
                          // await context.read<TodoService>().clearCompletedTodos(
                          //       context.read<User>(),
                          //       context.read<TodoListValueModel>().value!,
                          //     );

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
                              builder: (context) => EditTodoListScreen(
                                todoList: context.read<List<TodoList>>().first,
                              ),
                            ),
                          );
                        },
                      ),
                      // Divider(),
                      ListTile(
                        // enabled: context.read<TodoListValueModel>().isRemovable,
                        title: const Text(
                          'Delete task list',
                          style: TextStyle(
                              // color:
                              //     context.read<TodoListValueModel>().isRemovable
                              //         ? Colors.red
                              //         : Theme.of(context).disabledColor,
                              ),
                        ),
                        onTap: () {
                          // TodoListService(
                          //   user: context.read<User>(),
                          // ).removeTodoList(
                          //   context.read<TodoListValueModel>().value!,
                          // );
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
