import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_n_note/models/user.dart';
import 'package:task_n_note/screens/account_screen.dart';
import 'package:task_n_note/screens/setting_screen.dart';
import 'package:task_n_note/services/auth_service.dart';

class AccountDialog extends StatelessWidget {
  const AccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Task n\' Note'),
      content: ListTile(
        leading: CircleAvatar(
          child: context.read<User>().photoUrl != null
              ? Image.network(context.read<User>().photoUrl!)
              : const Icon(Icons.person),
        ),
        title: Text(context.read<User>().displayName ?? ''),
        subtitle: Text(context.read<User>().email ?? 'Email not set'),
      ),
      contentPadding: EdgeInsets.zero,
      // actionsPadding: EdgeInsets.zero,
      // insetPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actions: [
        const Divider(),
        ListTile(
          // tileColor: Colors.green,
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          },
          title: const Text('Manage Account'),
          trailing: const Icon(Icons.manage_accounts),
        ),
        ListTile(
          // tileColor: Colors.green,
          onTap: () async {
            final message = await AuthService().signOut();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
            Navigator.pop(context);
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
