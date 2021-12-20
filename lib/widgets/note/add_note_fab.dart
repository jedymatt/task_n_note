import 'package:flutter/material.dart';
import 'package:task_n_note/screens/note/add_note_screen.dart';

class AddNoteFab extends StatefulWidget {
  const AddNoteFab({Key? key}) : super(key: key);

  @override
  State<AddNoteFab> createState() => _AddNoteFabState();
}

class _AddNoteFabState extends State<AddNoteFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNoteScreen(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
