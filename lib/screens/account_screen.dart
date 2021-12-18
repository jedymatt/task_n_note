import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
