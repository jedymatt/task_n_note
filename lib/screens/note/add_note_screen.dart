import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';
import 'package:task_n_note/services/note_service.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

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
                if (_title.text == '' && _content.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cannot create an empty note'),
                    ),
                  );
                  return;
                }

                Note note = Note(
                  title: _title.text,
                  content: _content.text,
                );

                NoteService(user: context.read<User>()).addNote(note);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormField(
              controller: _title,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Note title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
              ),
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
                // expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
