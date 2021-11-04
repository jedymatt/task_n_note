// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4.0,
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          padding: EdgeInsets.only(bottom: 14.0),
          child: Center(
              child: Text(
            'My Tasks',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          )),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildTaskListTile(title: 'Do 69 pushups'),
              _buildTaskListTile(title: 'Buy Iphone'),
              _buildTaskListTile(title: 'Sell kidney'),
              ...faker.lorem
                  .sentences(10)
                  .map((sentence) => _buildTaskListTile(title: sentence))
                  .toList(),
              ExpansionTile(
                title: Text(
                  'Completed (3)',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                children: [
                  _buildTaskListTile(
                    title: 'Feed doggo',
                    isDone: true,
                  ),
                  _buildTaskListTile(
                    title: 'Create the ultimate master bait',
                    isDone: true,
                  ),
                  _buildTaskListTile(
                    title: 'Watch cartoon: One Piece in one day',
                    isDone: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListTile _buildTaskListTile({
    required String title,
    bool isDone = false,
  }) {
    return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(isDone ? Icons.check : Icons.circle_outlined),
      ),
      title: Text(title),
      onTap: () {},
    );
  }
}
