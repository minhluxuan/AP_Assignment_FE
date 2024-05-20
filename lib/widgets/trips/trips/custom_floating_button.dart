import 'package:flutter/material.dart';
import '../../../model/trips/template.dart';

class CustomWideFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String label;

  const CustomWideFloatingActionButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: FloatingActionButton(
        backgroundColor: mainColor,
        elevation: 5,
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: mainTextSize),
        ),
      ),
    );
  }
}
