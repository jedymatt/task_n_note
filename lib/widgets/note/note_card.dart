import 'package:flutter/material.dart';

import '../../models/note.dart';
import '../../screens/note/note_detail_screen.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
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
              builder: (context) => NoteDetailScreen(note: widget.note),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (widget.note.title != '')
                  ? Text(
                      widget.note.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  : const SizedBox.shrink(),
              (widget.note.content != '')
                  ? Text(widget.note.content)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
