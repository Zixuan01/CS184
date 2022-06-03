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
      
      child: Container(
        /*child: Text(
          'Selected Segment: ${_selectedSegment.name}',
          style: const TextStyle(color: Colors.black),
        ),*/
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child:
        Column(
          children: [
          Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.rice_bowl), // <-- Icon
                          Text("Food", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.shopping_bag), // <-- Icon
                          Text("shop",  style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.emoji_transportation), // <-- Icon
                          Text("Traffic", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.cake), // <-- Icon
                          Text("Snack", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
           ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.sports), // <-- Icon
                          Text("Sport",  style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.videogame_asset), // <-- Icon
                          Text("Game", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.phone), // <-- Icon
                          Text("Phone", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.local_hospital_rounded), // <-- Icon
                          Text("Health", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
           ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite), // <-- Icon
                          Text("Makeup", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.house_rounded), // <-- Icon
                          Text("House",  style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.book), // <-- Icon
                          Text("Study", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      splashColor: Colors.green, 
                      onTap: () {}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.people), // <-- Icon
                          Text("Network", style: TextStyle(fontSize: 13)), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
           ),
          ),
          
          ],
        ),
        ),
    );
  }
}