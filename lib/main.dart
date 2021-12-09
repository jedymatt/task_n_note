import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/firebase_options.dart';
import 'package:task_n_note/provider/notes_model.dart';
import 'package:task_n_note/services/auth_service.dart';
import 'package:task_n_note/services/todo_lists_service.dart';

import 'app.dart';
import 'provider/tasks_model.dart';
import 'services/notes_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasksModel()),
        ChangeNotifierProvider(create: (context) => NotesModel()),
        Provider(
          create: (context) => AuthService(),
        ),
        StreamProvider.value(
          value: AuthService().user,
          initialData: null,
        ),
        Provider(
          create: (context) => NotesService(),
        ),
        Provider(
          create: (context) => TodoListsService(),
        ),
      ],
      child: const App(),
    ),
  );
}
