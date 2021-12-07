// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/note.dart';
import 'package:task_n_note/provider/notes_model.dart';

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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool isEdited = false;

  @override
  void initState() {
    _titleController.text = widget.note.title;
    _contentController.text = widget.note.content;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotesModel>().removeNote(widget.note);

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
              controller: _titleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Note title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
              ),
              onChanged: (value) {
                setState(() {
                  if (_titleController.text == widget.note.title) {
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
                controller: _contentController,
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
                    if (_contentController.text == widget.note.content) {
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
                  title: _titleController.text,
                  content: _contentController.text,
                );
                context.read<NotesModel>().updateNote(updatedNote);

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
}
