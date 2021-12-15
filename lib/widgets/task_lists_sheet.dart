// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// // Flutter imports:
// import 'package:flutter/material.dart';

// // Package imports:
// import 'package:provider/provider.dart';
// import 'package:task_n_note/models/user.dart';
// import 'package:task_n_note/provider/todo_list_value_model.dart';
// import 'package:task_n_note/services/todo_list_service.dart';

// // Project imports:
// import '../models/todo_list.dart';
// import '../screens/add_todo_list_screen.dart';

// class TaskListsSheet extends StatefulWidget {
//   const TaskListsSheet({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _TaskListsSheetState createState() => _TaskListsSheetState();
// }

// class _TaskListsSheetState extends State<TaskListsSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       maxChildSize: 0.9,
//       expand: false,
//       builder: (context, scrollController) {
//         return StreamBuilder<List<TodoList>>(
//           stream: TodoListService(user: context.read<User>()).todoLists,
//           builder: (BuildContext context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error'),
//               );
//             }

//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             final querySnapshot = snapshot.requireData;

//             if (querySnapshot.isEmpty) {
//               return const Center(
//                 child: Text('Empty'),
//               );
//             }
//             final todoLists = snapshot.requireData;
//             return ListView.builder(
//               controller: scrollController,
//               itemCount: todoLists.length + 1,
//               itemBuilder: (context, index) {
//                 if (index == todoLists.length) {
//                   return Column(
//                     children: [
//                       Divider(
//                         thickness: 1.0,
//                       ),
//                       _buildAddTaskGroup(),
//                     ],
//                   );
//                 }

//                 return _buildTodoListTile(
//                   todoLists[index],
//                   context.read<TodoListValueModel>().value!.id ==
//                       todoLists[index].id,
//                 );
//               },
//             );
//           },
//         );
//         // List<TaskGroup> taskGroups =
//         //     Provider.of<TaskGroupListProvider>(context).taskGroups;

//         // int currentIndex =
//         //     Provider.of<TaskGroupListProvider>(context).selectedIndex;
//         // return SizedBox.shrink();
//         // return Consumer<TasksModel>(
//         //   builder: (context, tasksModel, child) {
//         //     return ListView(
//         //       controller: scrollController,
//         //       children: [
//         //         SizedBox(
//         //           height: 10.0,
//         //         ),
//         //         ...tasksModel.todoLists
//         //             .map((taskGroup) => _buildTaskGroupTile(
//         //                 taskGroup, taskGroup == tasksModel.currentTodoList))
//         //             .toList(),
//         //         Divider(
//         //           thickness: 1.0,
//         //         ),
//         //         _buildAddTaskGroup(),
//         //       ],
//         //     );
//         //   },
//         // );
//       },
//     );
//   }

//   Widget _buildAddTaskGroup() {
//     return ListTile(
//       title: Text(
//         'Create task list',
//         style: TextStyle(
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       trailing: Icon(Icons.add),
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(
//           builder: (context) {
//             return AddTodoListScreen();
//           },
//         ));
//       },
//     );
//   }

//   Widget _buildTodoListTile(TodoList todoList, bool isSelected) {
//     return ListTile(
//       title: Text(todoList.title),
//       selected: isSelected,
//       onTap: () {
//         if (isSelected) return;

//         context.read<TodoListValueModel>().updateValue(todoList);

//         Navigator.pop(context);
//       },
//     );
//   }
// }
