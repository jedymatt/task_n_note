import 'package:flutter/material.dart';

class InputPasswordDialog extends StatefulWidget {
  final Function(String value) onConfirm;

  const InputPasswordDialog({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  @override
  _InputPasswordDialogState createState() => _InputPasswordDialogState();
}

class _InputPasswordDialogState extends State<InputPasswordDialog> {
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm with password'),
      content: TextField(
        controller: _password,
        autofocus: true,
        obscureText: true,
        decoration: const InputDecoration(
          label: Text('Password'),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            widget.onConfirm(_password.text);
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ],
    );
  }
}
