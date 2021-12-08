// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../models/todo.dart';
import '../provider/tasks_model.dart';
import '../screens/task_detail_screen.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, model, child) {
        if (model.currentTodoList.todos.isEmpty) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              semanticChildCount: 2,
              // shrinkWrap: false,
              children: [
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Container(
                  height: kToolbarHeight,
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      model.currentTodoList.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SvgPicture.asset(
                        'assets/images/undraw_no_data_re_kwbl.svg',
                        semanticsLabel: 'Empty',
                        height: 150.0,
                      ),
                    ),
                    Text('Empty tasks'),
                  ],
                )
              ],
            ),
          );
        }

        return Scrollbar(
          interactive: true,
          child: ListView(
            shrinkWrap: true,
            // padding: EdgeInsets.only(top: 0.0),
            children: [
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Container(
                height: kToolbarHeight,
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    model.currentTodoList.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ...(model.currentTodoList.todos.isNotEmpty)
                  ? model.currentTodoList.todos
                      .map((task) => _buildTaskItem(task))
                      .toList()
                  : [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SvgPicture.asset(
                          'assets/images/undraw_no_data_re_kwbl.svg',
                          semanticsLabel: 'Empty',
                          height: 150.0,
                        ),
                      )
                    ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaskItem(Todo todo) {
    return Builder(
      builder: (context) {
        return ListTile(
          leading: IconButton(
            icon: Icon(todo.isComplete ? Icons.check : Icons.circle_outlined),
            onPressed: () {
              final updatedTodo = todo.copyWith(
                isComplete: !todo.isComplete,
              );

              // Provider.of<TasksModel>(context, listen: false)
              //     .updateTodo(updatedTodo);
              context.read<TasksModel>().updateTodo(updatedTodo);
            },
          ),
          title: Text(
            todo.title,
            style: todo.isComplete
                ? TextStyle(
                    color: Theme.of(context).disabledColor,
                  )
                : null,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailScreen(todo: todo),
              ),
            );
          },
        );
      },
    );
  }
}
