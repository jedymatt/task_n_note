// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Task n\' Note',
              style: GoogleFonts.robotoSlab(
                fontSize: 24.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Task Groups',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Edit'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kTextTabBarHeight),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildTaskGroupTile(title: 'My Tasks', isSelected: true),
          _buildTaskGroupTile(title: 'My Custom Tasks'),
          _buildTaskGroupTile(title: 'My Grocery list'),
        ],
      ),
    );
  }

  Widget _buildTaskGroupTile({required String title, bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ListTile(
        horizontalTitleGap: 0.0,
        title: Text(title),
        leading: Icon(Icons.label_outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(kTextTabBarHeight),
          ),
        ),
        selected: isSelected,
        selectedTileColor: Colors.indigo[50],
        onTap: () {},
      ),
    );
  }
}
