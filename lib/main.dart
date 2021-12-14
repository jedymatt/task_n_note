import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';
import '../provider/notes_model.dart';
import '../provider/todo_list_value_model.dart';
import '../services/auth_service.dart';
import '../services/todo_list_service.dart';
import '../services/todo_service.dart';
import 'app.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesModel(),
        ),
        StreamProvider<User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        Provider(
          create: (context) => TodoListService(),
        ),
        Provider(
          create: (context) => TodoService(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoListValueModel(),
        ),
      ],
      child: const App(),
    ),
  );
}
