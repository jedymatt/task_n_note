// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/note.dart';
import 'package:task_n_note/models/user.dart';
import 'package:task_n_note/services/notes_service.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note note;

  const NoteDetailScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  bool isEdited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<NotesService>()
                  .removeNote(context.read<User>(), widget.note);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormField(
              controller: _title,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Note title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
              ),
              onChanged: (value) {
                setState(() {
                  if (_title.text == widget.note.title) {
                    isEdited = false;
                  } else {
                    isEdited = true;
                  }
                });
              },
            ),
            const Divider(
              height: 0.0,
              thickness: 1.0,
              color: Colors.black12,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              child: TextFormField(
                controller: _content,
                decoration: const InputDecoration(
                  hintText: 'Note content',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                ),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    if (_content.text == widget.note.content) {
                      isEdited = false;
                    } else {
                      isEdited = true;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isEdited
          ? FloatingActionButton(
              onPressed: () {
                final updatedNote = widget.note.copyWith(
                  title: _title.text,
                  content: _content.text,
                );
                context
                    .read<NotesService>()
                    .updateNote(context.read<User>(), updatedNote);

                final snackBar = SnackBar(
                  content: const Text('Note updated!'),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pop(context);
              },
              child: const Icon(Icons.save),
            )
          : null,
    );
  }

  @override
  void initState() {
    _title.text = widget.note.title;
    _content.text = widget.note.content;

    super.initState();
  }
}
