import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/domain/historical_point.dart';
import 'package:sorcery_adventure_sheet/domain/monster.dart';

class MonsterDialog extends StatefulWidget {
  @override
  _MonsterDialogState createState() => _MonsterDialogState();
}

class _MonsterDialogState extends State<MonsterDialog> {
  String? _name;
  int _skill = 7;
  int _stamina = 7;
  bool? _isFriend;

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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '名前(任意)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                        value: _isFriend ?? false,
                        onChanged: (value) {
                          setState(() {
                            _isFriend = value;
                          });
                        }),
                    Text('味方')
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('技術点'),
                        NumberPicker(
                            textStyle: const TextStyle(fontSize: 18),
                            selectedTextStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            itemCount: 3,
                            value: _skill,
                            minValue: 1,
                            maxValue: 24,
                            itemHeight: 40,
                            itemWidth: 40,
                            onChanged: (value) {
                              setState(() {
                                _skill = value;
                              });
                            },
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black26),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text('体力点'),
                        NumberPicker(
                            textStyle: const TextStyle(fontSize: 18),
                            selectedTextStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            itemCount: 3,
                            value: _stamina,
                            minValue: 1,
                            maxValue: 99,
                            itemHeight: 40,
                            itemWidth: 40,
                            onChanged: (value) {
                              setState(() {
                                _stamina = value;
                              });
                            },
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black26),
                            )),
                      ],
                    )
                  ],
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
                      onPressed: () {
                        var result = Monster(
                            _skill, HistoricalPoint(_stamina, max: _stamina),
                            name: _name, isFriend: _isFriend ?? false);
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

Future<Monster?> showMonsterDialog(BuildContext context) async {
  return await showDialog<Monster>(
      context: context,
      builder: (context) {
        return MonsterDialog();
      });
}
