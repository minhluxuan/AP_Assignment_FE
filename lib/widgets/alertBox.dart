import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
