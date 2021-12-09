import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/note.dart';
import 'package:task_n_note/models/user.dart';
import 'package:task_n_note/screens/note/note_detail_screen.dart';
import 'package:task_n_note/services/notes_service.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<NotesService>().notes(context.read<User>()),
      initialData: const <Note>[],
      builder: (context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }

        if (snapshot.hasData) {
          final List<Note> notes = snapshot.data!;

          return Scrollbar(
            interactive: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return _buildNoteCard(notes[index]);
              },
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // return StreamBuilder(
    //   stream: Provider.of<NotesModel>(context).notesAsStream,
    //   builder: (context, AsyncSnapshot<List<Note>> snapshot) {
    //     if (snapshot.hasError) {
    //       return Scaffold(
    //         body: SingleChildScrollView(
    //           child: Text(snapshot.toString()),
    //         ),
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       if (snapshot.hasData) {
    //         return Scrollbar(
    //           interactive: true,
    //           child: ListView(
    //             shrinkWrap: true,
    //             children: [
    //               const Padding(
    //                 padding: EdgeInsets.only(bottom: 8.0),
    //                 child: Divider(
    //                   thickness: 1.0,
    //                   height: 1.0,
    //                 ),
    //               ),
    //               ...snapshot.data!
    //                   .map((note) => _buildNoteCard(note))
    //                   .toList(),
    //             ],
    //           ),
    //         );
    //       }
    //     }

    //     /// ConnectionState.waiting
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }

    //     if (snapshot.connectionState == ConnectionState.none) {
    //       log('connectionState.none');
    //     }

    //     log(snapshot.connectionState.toString());
    //     return const Center(child: Text('unknown'));
    //   },
    // );

    // return StreamBuilder<List<Note>>(
    //     stream: Provider.of<NotesModel>(context).notesAsStream,
    //     builder: (context, snapshot) {
    //       return Consumer<NotesModel>(
    //         builder: (context, model, child) {
    //           return Scrollbar(
    //             interactive: true,
    //             child: ListView(
    //               shrinkWrap: true,
    //               children: const [
    //                 Padding(
    //                   padding: EdgeInsets.only(bottom: 8.0),
    //                   child: Divider(
    //                     thickness: 1.0,
    //                     height: 1.0,
    //                   ),
    //                 ),
    //                 ...model.notes.map((note) => _buildNoteCard(note)).toList(),
    //               ],
    //             ),
    //           );
    //         },
    //       );
    //     });
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
