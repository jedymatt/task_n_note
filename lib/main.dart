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
        ),
        home: LoginScreen(),
        // home: HomeScreen(),
      ),
    );
  }
}
