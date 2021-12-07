// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/user_entity.dart';
import 'package:task_n_note/provider/notes_model.dart';
import 'package:task_n_note/screens/home_screen.dart';
import 'package:task_n_note/services/auth_service.dart';

import 'provider/tasks_model.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasksModel()),
        ChangeNotifierProvider(create: (context) => NotesModel()),
        StreamProvider.value(
          value: AuthService().user,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        theme: _buildThemeData(context),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            log(snapshot.data.toString());
            if (snapshot.hasError) {
              return const Scaffold(
                body: Center(
                  child: Text('Unknown error has occured'),
                ),
              );
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              final user = Provider.of<UserEntity?>(context);
              if (user == null) {
                return LoginScreen();
              } else {
                return HomeScreen();
              }
              // return const Root();
            }
            // Otherwise, show something whilst waiting for initialization to complete
            return const Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  ThemeData _buildThemeData(context) {
    return ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(),
      primarySwatch: Colors.indigo,
      appBarTheme: AppBarTheme.of(context).copyWith(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColorDark,
        elevation: 0.0,
      ),
      tabBarTheme: TabBarTheme.of(context).copyWith(
        labelColor: Theme.of(context).primaryColorDark,
        unselectedLabelColor: Theme.of(context).primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
