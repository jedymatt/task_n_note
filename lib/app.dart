// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../provider/tasks_model.dart';
import './screens/login_screen.dart';

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
