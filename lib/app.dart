// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // shadowColor: Colors.indigo[50],
        appBarTheme: AppBarTheme(
          // shadowColor: Colors.indigo[50],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Theme.of(context).primaryColor,

          elevation: 0.0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
