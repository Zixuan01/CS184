// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

enum Sky { expense, income }

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

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: AddControl(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }
}

class AddControl extends StatefulWidget {
  const AddControl({Key? key}) : super(key: key);

  @override
  State<AddControl> createState() => _AddControlState();
}

class _AddControlState extends State<AddControl> {
  Sky _selectedSegment = Sky.expense;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black,
        padding: EdgeInsetsDirectional.all(5.0),
        // border: Border(bottom: BorderSide(width: 10.0)),
        
        leading: Material(
          color: Colors.black,
          child: IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
        ))),

        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey3,
          thumbColor: CupertinoColors.systemGrey,
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
            Sky.expense: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Expense',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.income: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Income',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          },
        ),
      ),
      child: Center(
        child: Text(
          'Selected Segment: ${_selectedSegment.name}',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}