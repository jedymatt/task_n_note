import 'package:flutter/material.dart';

class TextButtonToggle extends StatefulWidget {
  final bool value;
  final Widget child;

  /// If not null, this child is shown if the value is false else show child.
  final Widget? childFallback;
  final Function(bool value)? onPressed;

  const TextButtonToggle({
    Key? key,
    required this.value,
    required this.child,
    this.childFallback,
    this.onPressed,
  }) : super(key: key);

  @override
  _TextButtonToggleState createState() => _TextButtonToggleState();
}

class _TextButtonToggleState extends State<TextButtonToggle> {
  late bool value;

  @override
  void initState() {
    value = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          value = !value;
        });
        widget.onPressed!(value);
      },
      child: value ? widget.child : (widget.childFallback ?? widget.child),
    );
  }
}
