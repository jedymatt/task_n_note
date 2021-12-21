import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/providers/dark_mode_provider.dart';

import '../core/enums.dart';

class DarkModeScreen extends StatefulWidget {
  const DarkModeScreen({Key? key}) : super(key: key);

  @override
  State<DarkModeScreen> createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(builder: (context, darkMode, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Dark Mode'),
        ),
        body: Column(
          children: [
            RadioListTile<DarkMode>(
              title: const Text('Off'),
              value: DarkMode.off,
              groupValue: darkMode.value,
              onChanged: (value) {
                setState(() {
                  darkMode.value = value!;
                });
              },
            ),
            RadioListTile<DarkMode>(
              title: const Text('On'),
              value: DarkMode.on,
              groupValue: darkMode.value,
              onChanged: (value) {
                setState(() {
                  darkMode.value = value!;
                });
              },
            ),
            RadioListTile<DarkMode>(
              title: const Text('System'),
              value: DarkMode.system,
              groupValue: darkMode.value,
              onChanged: (value) {
                setState(() {
                  darkMode.value = value!;
                });
              },
            ),
          ],
        ),
      );
    });
  }
}
