import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/models.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Account Information'),
          ),
          body: Column(
            children: [
              ListTile(
                title: Text(value.email ?? 'Email not set'),
              ),
            ],
          ),
        );
      },
    );
  }
}
