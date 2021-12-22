import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final Widget child;

  const AnimatedFab({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
