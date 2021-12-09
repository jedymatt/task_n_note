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
      foregroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shape: CircleBorder(
        side: BorderSide(
          width: 2.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
