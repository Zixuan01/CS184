// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

enum Sky { expense, income }

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Sky _selectedSegment = Sky.expense;
  static const color_o = Color(0xFFFFC107);
  int _selected_index = -1;

  Widget expanse = Container(
    /*child: Text(
          'Selected Segment: ${_selectedSegment.name}',
          style: const TextStyle(color: Colors.black),
        ),*/
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    // color: Color.fromARGB(114, 238, 230, 201),
                    color: color_o,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.rice_bowl), // <-- Icon
                          Text("Food",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.shopping_bag), // <-- Icon
                          Text("Shop",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.emoji_transportation), // <-- Icon
                          Text("Traffic",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.cake), // <-- Icon
                          Text("Snack",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.sports), // <-- Icon
                          Text("Sport",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.videogame_asset), // <-- Icon
                          Text("Game",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.phone), // <-- Icon
                          Text("Phone",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.local_hospital_rounded), // <-- Icon
                          Text("Health",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite), // <-- Icon
                          Text("Makeup",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.house_rounded), // <-- Icon
                          Text("House",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.book), // <-- Icon
                          Text("Study",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.people), // <-- Icon
                    Text("Network",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
      child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                  child: Card(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter amount',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        //setState(() {
                        //  _amount = int.parse(value);
                        //});
                      },
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                  child: Card(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter notes',
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      onChanged: (value) {
                        //setState(() {
                        //  _amount = int.parse(value);
                        //});
                      },
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: SizedBox.fromSize(
                  size: Size(300, 60),
                  child: ClipRect(
                    child: Material(
                      color: Color.fromARGB(114, 238, 230, 201),
                      child: InkWell(
 
                        onTap: () {
                          // Navigator.of(context).pushNamed('/save_daily');
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_sharp), // <-- Icon
                            Text("Add New Record", style: TextStyle(fontSize: 20)), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          ),
        )
      ],
    ),
  );

  Widget income = SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add_card), // <-- Icon
                          Text("Salary",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.card_membership), // <-- Icon
                          Text("Award",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.credit_card), // <-- Icon
                          Text("Interest",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.card_giftcard), // <-- Icon
                          Text("Gift",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.group_add), // <-- Icon
                          Text("Dividend",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.trending_up), // <-- Icon
                          Text("Stocks",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_back), // <-- Icon
                          Text("Borrow",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.download), // <-- Icon
                          Text("Received",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox.fromSize(
                size: Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: Color.fromARGB(114, 238, 230, 201),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.house), // <-- Icon
                          Text("Rent",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.child_care), // <-- Icon
                          Text("Alimony",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.attach_money), // <-- Icon
                          Text("Fund",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add), // <-- Icon
                          Text("Others",
                              style: TextStyle(fontSize: 13)), // <-- Text
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
      child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                  child: Card(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter amount',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        //setState(() {
                        //  _amount = int.parse(value);
                        //});
                      },
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                  child: Card(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter notes',
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      onChanged: (value) {
                        //setState(() {
                        //  _amount = int.parse(value);
                        //});
                      },
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: SizedBox.fromSize(
                  size: Size(300, 60),
                  child: ClipRect(
                    child: Material(
                      color: Color.fromARGB(114, 238, 230, 201),
                      child: InkWell(
 
                        onTap: () {
                          // Navigator.of(context).pushNamed('/save_daily');
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_sharp), // <-- Icon
                            Text("Add New Record", style: TextStyle(fontSize: 20)), // <-- Text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          ),
        )
      ],
    ),
  );

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _selectedSegment == Sky.expense ? expanse : income,
            ],
          ),
        )
        );
  }
}
