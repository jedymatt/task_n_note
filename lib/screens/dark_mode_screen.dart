import 'package:flutter/material.dart';

enum DarkMode {
  off,
  on,
  system,
}

class DarkModeScreen extends StatefulWidget {
  const DarkModeScreen({Key? key}) : super(key: key);

  @override
  State<DarkModeScreen> createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen> {
  DarkMode _darkMode = DarkMode.off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode'),
      ),
      body: Column(
        children: [
          RadioListTile<DarkMode>(
            title: const Text('Off'),
            value: DarkMode.off,
            groupValue: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value!;
              });
            },
          ),
          RadioListTile<DarkMode>(
            title: const Text('On'),
            value: DarkMode.on,
            groupValue: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value!;
              });
            },
          ),
          RadioListTile<DarkMode>(
            title: const Text('System'),
            value: DarkMode.system,
            groupValue: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
