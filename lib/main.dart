// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'provider/tasks_model.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TasksModel(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        home: LoginScreen(),
        // home: HomeScreen(),
      ),
    );
  }
}
