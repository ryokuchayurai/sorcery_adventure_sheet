import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  factory CircleIconButton.icon(IconData icon,
          {required VoidCallback onPressed, Color? color, Color? iconColor}) =>
      CircleIconButton(Icon(icon, color: iconColor, size: 12),
          onPressed: onPressed, color: color);

  CircleIconButton(this.child, {required this.onPressed, this.color});

  final Widget child;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(), primary: color, padding: EdgeInsets.zero),
    );
  }
}
