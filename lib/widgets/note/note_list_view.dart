import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/note.dart';
import '../../models/user.dart';
import '../../services/note_service.dart';
import '../../widgets/note/note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: NoteService(user: context.read<User>()).notes,
      initialData: const <Note>[],
      child: Consumer<List<Note>>(
        builder: (context, notes, child) {
          return Scrollbar(
            interactive: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteCard(note: notes[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
