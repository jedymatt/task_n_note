// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/note.dart';
import 'package:task_n_note/provider/notes_model.dart';
import 'package:task_n_note/screens/note_detail_screen.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesModel>(
      builder: (context, model, child) {
        return Scrollbar(
          interactive: true,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
              ),
              ...model.notes.map((note) => _buildNoteCard(note)).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNoteCard(Note note) {
    return Builder(builder: (context) {
      return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(width: 1.0, color: Colors.black12),
        ),
        elevation: 0.0,
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteDetailScreen(note: note),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (note.title != '')
                    ? Text(
                        note.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )
                    : const SizedBox.shrink(),
                (note.content != '')
                    ? Text(note.content)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
