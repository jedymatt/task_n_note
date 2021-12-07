import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:task_n_note/core/utils.dart';
import 'package:task_n_note/models/note.dart';
import 'package:task_n_note/provider/notes_model.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  // final QuillController _contentController = QuillController.basic();
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
                if (_titleController.text == '' &&
                    _contentController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cannot create an empty note'),
                    ),
                  );
                  return;
                }

                Note note = Note(
                  id: uuidV4(),
                  title: _titleController.text,
                  content: _contentController.text,
                );

                Provider.of<NotesModel>(context, listen: false).addNote(note);

                Navigator.pop(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
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
                controller: _contentController,
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
