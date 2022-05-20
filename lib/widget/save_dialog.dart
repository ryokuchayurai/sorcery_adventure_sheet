import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class SaveDialog extends StatefulWidget {
  SaveDialog({this.name});

  final String? name;

  @override
  _SaveDialogState createState() => _SaveDialogState();
}

class _SaveDialogState extends State<SaveDialog> {
  late String _name;

  @override
  void initState() {
    super.initState();
    _name = widget.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '冒険記録紙の名前',
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Routemaster.of(context).pop(null);
                    },
                  ),
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: _name.isEmpty
                        ? null
                        : () {
                            Routemaster.of(context).pop(_name);
                          },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

Future<String?> showSaveDialog(BuildContext context, {String? name}) async {
  return await showDialog<String?>(
      context: context,
      builder: (context) {
        return SaveDialog(
          name: name,
        );
      });
}
