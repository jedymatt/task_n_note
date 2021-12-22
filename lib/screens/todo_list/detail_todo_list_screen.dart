import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/screens/todo/add_todo_screen.dart';
import 'package:task_n_note/screens/todo/detail_todo_screen.dart';
import 'package:task_n_note/screens/todo_list/edit_todo_list_screen.dart';
import 'package:task_n_note/services/todo_list_service.dart';
import 'package:task_n_note/services/todo_service.dart';
import 'package:task_n_note/widgets/checker_list_tile.dart';

class DetailTodoListScreen extends StatefulWidget {
  final TodoList todoList;

  const DetailTodoListScreen({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  State<DetailTodoListScreen> createState() => _DetailTodoListScreenState();
}

class _DetailTodoListScreenState extends State<DetailTodoListScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController(
      initialScrollOffset: _scrollOffset,
    );

    final todoList = widget.todoList;
    return Scaffold(
      appBar: AppBar(
        title: StreamProvider<TodoList?>.value(
          value: TodoListService(user: context.read<User>())
              .todoList(widget.todoList.id!),
          initialData: null,
          builder: (context, child) {
            return Consumer<TodoList?>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(value?.title ?? todoList.title);
              },
            );
          },
        ),
        centerTitle: true,
      ),
      body: StreamProvider<List<Todo>>.value(
        value: TodoService(
          user: context.read<User>(),
          todoList: todoList,
        ).todos,
        initialData: const [],
        child: Consumer<List<Todo>>(
          builder: (context, todos, child) {
            return ListView.builder(
              key: ObjectKey(todos.hashCode),
              controller: _scrollController,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return CheckerListTile(
                  title: todos[index].title,
                  value: todos[index].isComplete,
                  onChanged: (value) {
                    final todo = todos[index].copyWith(isComplete: value);
                    TodoService(
                      user: context.read<User>(),
                      todoList: todoList,
                    ).updateTodo(todo);

                    setState(() {
                      _scrollOffset = _scrollController.offset;
                    });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Provider.value(
                          value: todoList,
                          child: DetailTodoScreen(
                            todo: todos[index],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoScreen(todoList: todoList),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
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
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        ListTile(
                          title: const Text('Mark all as complete'),
                          onTap: () {
                            TodoService(
                                    user: context.read<User>(),
                                    todoList: todoList)
                                .toggleAllTodos(toComplete: true);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Clear all completed'),
                          onTap: () {
                            TodoService(
                                    user: context.read<User>(),
                                    todoList: todoList)
                                .clearCompletedTodos();
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        StreamProvider<TodoList?>.value(
                          value: TodoListService(user: context.read<User>())
                              .todoList(widget.todoList.id!),
                          initialData: null,
                          builder: (context, child) {
                            return Consumer<TodoList?>(
                              builder: (context, value, child) {
                                return ListTile(
                                  title: const Text('Rename task list'),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditTodoListScreen(
                                          todoList: value ?? todoList,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        // Divider(),
                        ListTile(
                          title: const Text(
                            'Delete task list',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {
                            TodoListService(
                              user: context.read<User>(),
                            ).removeTodoList(
                              todoList,
                            );
                            Navigator.of(context)
                              ..pop()
                              ..pop();
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
      ),
    );
  }
}
