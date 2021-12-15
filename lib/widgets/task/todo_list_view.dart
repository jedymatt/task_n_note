import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/screens/detail_todo_list_screen.dart';
import 'package:task_n_note/services/todo_list_service.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TodoListService(user: context.read<User>()).todoLists,
      initialData: const <TodoList>[],
      builder: (context, AsyncSnapshot<List<TodoList>> snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }

        if (snapshot.hasData) {
          final List<TodoList> todoLists = snapshot.requireData;

          return ListView.builder(
            itemCount: todoLists.length,
            itemBuilder: (context, index) {
              return _buildTodoList(todoLists[index]);
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildTodoList(TodoList todoList) {
    return Builder(builder: (context) {
      return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(width: 1.0, color: Colors.black12),
        ),
        elevation: 0.0,
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailTodoListScreen(
                  todoList: todoList,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              todoList.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    });
  }
}
