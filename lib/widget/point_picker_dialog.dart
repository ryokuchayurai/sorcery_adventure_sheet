import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/widget/circle_button.dart';

class PointPickerDialog extends StatefulWidget {
  PointPickerDialog(this.title, this.value,
      {this.max, this.editableMax = false, this.onChange});

  final String title;
  final int value;
  final int? max;
  final bool editableMax;
  final Function(int value, int? max)? onChange;

  @override
  _PointPickerDialogState createState() => _PointPickerDialogState();
}

class _PointPickerDialogState extends State<PointPickerDialog> {
  late int _currentValue;
  int? _currentMaxValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
    _currentMaxValue = widget.max;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        // title: Text(widget.title, textAlign: TextAlign.center),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Text('${widget.title}'),
                NumberPicker(
                  textStyle: TextStyle(fontSize: 30),
                  selectedTextStyle:
                      TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  itemCount: 3,
                  value: _currentValue,
                  minValue: 0,
                  maxValue: _currentMaxValue ?? 999999,
                  itemHeight: 70,
                  itemWidth: 100,
                  onChanged: (value) {
                    setState(() => _currentValue = value);
                    widget.onChange?.call(_currentValue, _currentMaxValue);
                  },
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                Row(
                  children: [
                    CircleIconButton.icon(Icons.add,
                        iconColor: Colors.black,
                        color: Colors.white, onPressed: () {
                      if (_currentValue >= (_currentMaxValue ?? 999999)) return;
                      setState(() {
                        _currentValue++;
                      });
                    }),
                    CircleIconButton.icon(
                      Icons.remove,
                      iconColor: Colors.black,
                      color: Colors.white,
                      onPressed: () {
                        if (_currentValue <= 0) return;
                        setState(() {
                          _currentValue--;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            if (widget.editableMax) ...[
              SizedBox(width: 10),
              Column(
                children: [
                  Text('原点'),
                  NumberPicker(
                      textStyle:
                          const TextStyle(fontSize: 16, color: Colors.black45),
                      selectedTextStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                      itemCount: 3,
                      value: _currentMaxValue!,
                      minValue: 0,
                      maxValue: 99,
                      itemHeight: 70,
                      itemWidth: 50,
                      onChanged: (value) {
                        setState(() {
                          if (_currentValue > value) _currentValue = value;
                          _currentMaxValue = value;
                        });
                        widget.onChange?.call(_currentValue, _currentMaxValue);
                      },
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black26),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleIconButton.icon(Icons.add,
                          iconColor: Colors.black,
                          color: Colors.white, onPressed: () {
                        if (_currentMaxValue! >= 99) return;
                        setState(() {
                          _currentMaxValue = _currentMaxValue! + 1;
                        });
                      }),
                      CircleIconButton.icon(Icons.remove,
                          iconColor: Colors.black,
                          color: Colors.white, onPressed: () {
                        if (_currentMaxValue! <= 0) return;
                        setState(() {
                          _currentMaxValue = _currentMaxValue! - 1;
                          if (_currentValue > _currentMaxValue!) {
                            _currentValue = _currentMaxValue!;
                          }
                        });
                      }),
                    ],
                  )
                ],
              ),
            ],
          ]),
          SizedBox(height: 28),
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
                child: Text(_buttonText()),
                onPressed: _diffValue() == 0 && _diffMaxValue() == 0
                    ? null
                    : () {
                        if (widget.value == _currentValue &&
                            widget.max == _currentMaxValue) {
                          Routemaster.of(context).pop(null);
                          return;
                        }
                        Routemaster.of(context).pop(PointPickerResult(
                            _currentValue,
                            max: _currentMaxValue));
                      },
              )
            ],
          )
        ]);
  }

  String _buttonText() {
    if (_diffValue() == 0 && _diffMaxValue() == 0) return '変更してください';

    String result = '';
    if (_diffValue() != 0) {
      result = _formatValue(_diffValue());
    }

    if (_diffMaxValue() != 0) {
      if (result.isEmpty) {
        result = '原点 ${_formatValue(_diffMaxValue())}';
      } else {
        result += ' (原点 ${_formatValue(_diffMaxValue())})';
      }
    }
    return result;
  }

  String _formatValue(int num) => num > 0 ? '+$num' : '$num';

  int _diffValue() {
    return _currentValue - widget.value;
  }

  int _diffMaxValue() {
    if (widget.max == null || _currentMaxValue == null) return 0;
    return _currentMaxValue! - widget.max!;
  }
}

class PointPickerResult {
  PointPickerResult(this.point, {this.max});

  final int point;
  final int? max;
}

Future<PointPickerResult?> showPointPickerDialog(
    BuildContext context, String title, int point,
    {int? max, bool? editableMax}) async {
  return await showDialog<PointPickerResult>(
      context: context,
      builder: (context) {
        return PointPickerDialog(
          title,
          point,
          max: max,
          editableMax: editableMax ?? false,
        );
      });
}
