// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Flutter imports:
import 'package:flutter/material.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      interactive: true,
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Divider(
              thickness: 1.0,
              height: 1.0,
            ),
          ),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
          _buildNoteCard(),
        ],
      ),
    );
  }

  Widget _buildNoteCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(width: 1.0, color: Colors.black12),
      ),
      elevation: 0.0,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'title',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text('description'),
            ],
          ),
        ),
      ),
    );
  }
}
