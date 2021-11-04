// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_n_note/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: GoogleFonts.nunito(),
        ),
        appBarTheme: AppBarTheme(
            toolbarTextStyle: GoogleFonts.varelaRound(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      ),
      home: HomeScreen(),
    );
  }
}
