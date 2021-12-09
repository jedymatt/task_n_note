import 'package:flutter/material.dart';

class NotesBottomAppBar extends StatelessWidget {
  const NotesBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      // child: Row(
      //   children: [
      // Spacer(),
      // Opacity(
      //   opacity: 0.0,
      //   child: IconButton(
      //     onPressed: null,
      //     icon: Icon(Icons.search),
      //   ),
      // ),
      //   ],
      // ),
      child: SizedBox(
        height: IconTheme.of(context).size! * 2,
      ),
    );
  }
}
