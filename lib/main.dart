import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/user.dart';

import '../firebase_options.dart';
import '../services/auth_service.dart';
import 'app.dart';
import 'providers/dark_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final darkModeProvider = DarkModeProvider();

  runApp(
    MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => darkModeProvider),
      ],
      child: const App(),
    ),
  );
}
