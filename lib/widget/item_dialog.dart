import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/domain/item.dart';

class ItemDialog extends StatefulWidget {
  ItemDialog(this.title, {this.name, this.paragraph, this.memo});

  final String title;
  final String? name;
  final int? paragraph;
  final String? memo;

  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  late String _name;
  int? _paragraph;
  String? _memo;

  @override
  void initState() {
    super.initState();
    _name = widget.name ?? '';
    _paragraph = widget.paragraph;
    _memo = widget.memo;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: widget.title,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  initialValue: widget.name,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'メモ(任意)',
                  ),
                  initialValue: widget.memo,
                  onChanged: (value) {
                    _memo = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'パラグラフ(任意)',
                  ),
                  initialValue: widget.paragraph?.toString() ?? null,
                  onChanged: (value) {
                    _paragraph = value.isNotEmpty ? int.parse(value) : null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                              var result = Item(_name,
                                  paragraph: _paragraph, memo: _memo);
                              Routemaster.of(context).pop(result);
                            },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<Item?> showItemDialog(BuildContext context, String title,
    {String? name, int? paragraph, String? memo}) async {
  return await showDialog<Item>(
      context: context,
      builder: (context) {
        return ItemDialog(
          title,
          name: name,
          paragraph: paragraph,
          memo: memo,
        );
      });
}
