import 'package:flutter/material.dart';

Future<dynamic> showConfirmationDialog(BuildContext context,
    {String title = "attention!",
    String content = "Do you really want to perform this action?",
    String affirmativeOption = "Confirm"}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("cancel")),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              affirmativeOption.toUpperCase(),
              style: const TextStyle(
                  color: Colors.brown, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
