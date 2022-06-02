// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

enum Sky { midnight, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
};

void main() => runApp(const AddPage());

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int _selected_index = 0;
  static const option_style = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const String _title = 'CupertinoSlidingSegmentedControl Sample';

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: _title,
      home: SegmentedControlSample(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }
}

class SegmentedControlSample extends StatefulWidget {
  const SegmentedControlSample({Key? key}) : super(key: key);

  @override
  State<SegmentedControlSample> createState() => _SegmentedControlSampleState();
}

class _SegmentedControlSampleState extends State<SegmentedControlSample> {
  Sky _selectedSegment = Sky.midnight;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: skyColors[_selectedSegment],
      navigationBar: CupertinoNavigationBar(
        // This Cupertino segmented control has the enum "Sky" as the type.
        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey2,
          thumbColor: skyColors[_selectedSegment]!,
          // This represents the currently selected segmented control.
          groupValue: _selectedSegment,
          // Callback that sets the selected segmented control.
          onValueChanged: (Sky? value) {
            if (value != null) {
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          children: const <Sky, Widget>{
            Sky.midnight: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Midnight',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.viridian: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Viridian',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.cerulean: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Cerulean',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          },
        ),
      ),
      child: Center(
        child: Text(
          'Selected Segment: ${_selectedSegment.name}',
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ),
    );
  }
}