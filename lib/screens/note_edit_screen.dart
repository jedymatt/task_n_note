// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final QuillController _quillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: 'Note title',
            ),
            // TextFormField(
            //   initialValue: 'Note Description',
            //   maxLines: 4,
            // )
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: QuillEditor.basic(
                  controller: _quillController,
                  readOnly: false, // true for view only mode
                ),
              ),
            ),
            QuillToolbar.basic(
              controller: _quillController,
              showImageButton: false,
              showVideoButton: false,
              multiRowsDisplay: false,
              showCameraButton: false,
              showCodeBlock: false,
            ),
          ],
        ),
      ),
    );
  }
}
