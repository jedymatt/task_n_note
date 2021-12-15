import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({Key? key}) : super(key: key);

  @override
  _ManageAccountScreenState createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Center(
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Divider(),
                ListTile(
                  title:
                      Text(context.read<User>().displayName ?? 'Name not set'),
                ),
                const Divider(),
                ListTile(
                  title: Text(context.read<User>().email ?? 'No email'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
