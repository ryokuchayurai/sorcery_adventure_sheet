import 'package:flutter/material.dart';

Future<bool?> showAlertDialog(
    BuildContext context, String title, String message,
    {bool? onlyOk}) async {
  var result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            if (!(onlyOk ?? false))
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      });
  return result;
}
