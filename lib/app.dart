import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/enums.dart';
import 'package:task_n_note/providers/dark_mode_provider.dart';

import 'models/models.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (context, darkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildThemeData(),
          darkTheme: _buildDarkThemeData(),
          themeMode: getThemeMode(),
          home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Scaffold(
                  body: Center(
                    child: Text('Unknown error has occured'),
                  ),
                );
              }

              // Once complete, show your application
              if (snapshot.connectionState == ConnectionState.done) {
                final user = Provider.of<User?>(context);
                if (user == null) {
                  return const LoginScreen();
                } else {
                  return const HomeScreen();
                }
              }
              // Otherwise, show something whilst waiting for initialization to complete
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  ThemeMode getThemeMode() {
    final mode = context.read<DarkModeProvider>().value;
    switch (mode) {
      case DarkMode.off:
        return ThemeMode.light;
      case DarkMode.on:
        return ThemeMode.dark;
      case DarkMode.system:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.indigo,
      shadowColor: Colors.indigoAccent,
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

  ThemeData _buildDarkThemeData() {
    return ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.indigo,
      brightness: Brightness.dark,
      shadowColor: Colors.indigoAccent,
      appBarTheme: AppBarTheme.of(context).copyWith(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      tabBarTheme: TabBarTheme.of(context).copyWith(
        labelColor: Theme.of(context).primaryColor,
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
