import 'package:flutter/material.dart';

class CheckerListTile extends StatefulWidget {
  final String title;
  final bool value;
  final Function(bool value)? onChanged;
  final VoidCallback? onTap;

  const CheckerListTile({
    Key? key,
    required this.title,
    required this.value,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  _CheckerListTileState createState() => _CheckerListTileState();
}

class _CheckerListTileState extends State<CheckerListTile> {
  late bool value;
  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(value ? Icons.check : Icons.circle_outlined),
        onPressed: () {
          setState(() {
            value = !value;
          });
          widget.onChanged!(value);
        },
      ),
      title: Text(
        widget.title,
        style: value
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
      onTap: widget.onTap,
    );
  }
}
