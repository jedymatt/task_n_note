import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/services/auth_service.dart';

import 'models/user.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(context),
      home: StreamBuilder<User?>(
        stream: AuthService().user,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('Unknown error has occured'),
              ),
            );
          }

          if (snapshot.connectionState != ConnectionState.active) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData) {
            final user = snapshot.requireData;
            if (user != null) {
              return Provider<User>.value(
                builder: (context, child) {
                  return const HomeScreen();
                },
                value: user,
              );
            } else {
              return const LoginScreen();
            }
          } else {
            return const LoginScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      // futureBuilder: when hot restarted, returns to loginPage even when user is logged in
      // home: FutureBuilder(
      //   future: _initialization,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return const Scaffold(
      //         body: Center(
      //           child: Text('Unknown error has occured'),
      //         ),
      //       );
      //     }

      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: Text('Empty'),
      //       );
      //     }

      //     // Once complete, show your application
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       final user = context.read<User?>();
      //       if (user == null) {
      //         return const LoginScreen();
      //       } else {
      //         return const HomeScreen();
      //       }
      //       // return const Root();
      //     }
      //     // Otherwise, show something whilst waiting for initialization to complete
      //     return const Scaffold(
      //       body: Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //     );
      //   },
      // ),
    );
  }

  ThemeData _buildThemeData(context) {
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
}
