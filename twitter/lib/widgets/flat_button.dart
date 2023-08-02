import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomFlatButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w900,
          fontSize: 30,
          height: 1,
        ),
      ),
    );
  }
}
