import 'package:flutter/material.dart';
import 'package:task_n_note/screens/login_screen.dart';
import 'package:task_n_note/screens/setting_screen.dart';
import 'package:task_n_note/services/auth_service.dart';

class AccountDialog extends StatelessWidget {
  const AccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Task n\' Note'),
      content: const ListTile(
        // tileColor: Colors.green,
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text('Anonymous'),
        subtitle: Text('No email'),
      ),
      contentPadding: EdgeInsets.zero,
      // actionsPadding: EdgeInsets.zero,
      // insetPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actions: [
        const Divider(),
        ListTile(
          // tileColor: Colors.green,
          onTap: () {},
          title: const Text('Manage Account'),
          trailing: const Icon(Icons.manage_accounts),
        ),
        ListTile(
          // tileColor: Colors.green,
          onTap: () {
            AuthService().signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => route.isFirst);
          },
          title: const Text('Logout'),
          trailing: const Icon(Icons.logout),
        ),
        ListTile(
          // tileColor: Colors.green,
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingScreen(),
              ),
            );
          },
          title: const Text('Settings'),
          trailing: const Icon(Icons.settings),
        )
      ],
    );
  }
}
