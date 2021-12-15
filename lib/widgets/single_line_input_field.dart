import 'package:flutter/material.dart';

class SingleLineInputField extends StatefulWidget {
  final TextEditingController controller;
  final bool? autofocus;
  final String? hintText;

  const SingleLineInputField({
    Key? key,
    required this.controller,
    this.autofocus,
    this.hintText,
  }) : super(key: key);

  @override
  _SingleLineInputFieldState createState() => _SingleLineInputFieldState();
}

class _SingleLineInputFieldState extends State<SingleLineInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        hintText: widget.hintText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}
